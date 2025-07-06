#!/bin/bash

# NUR-AL-EYN Hospital Management System - Deployment Script

set -e

echo "🏥 NUR-AL-EYN Hospital Management System - Deployment Script"
echo "=========================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

print_status "Checking prerequisites..."

# Create necessary directories
print_status "Creating necessary directories..."
mkdir -p ssl
mkdir -p logs
mkdir -p media

# Generate SSL certificate (self-signed for development)
if [ ! -f ssl/cert.pem ] || [ ! -f ssl/key.pem ]; then
    print_status "Generating SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ssl/key.pem \
        -out ssl/cert.pem \
        -subj "/C=KE/ST=Nairobi/L=Nairobi/O=NUR-AL-EYN Hospital/CN=localhost"
    print_success "SSL certificate generated"
fi

# Set environment variables
if [ ! -f .env ]; then
    print_status "Creating .env file..."
    cat > .env << EOF
# NUR-AL-EYN Hospital Environment Variables
SECRET_KEY=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1,0.0.0.0
DATABASE_URL=postgresql://nuraleyn:nuraleyn123@db:5432/nuraleyn_hospital
REDIS_URL=redis://redis:6379/0
EOF
    print_success ".env file created"
fi

# Build and start services
print_status "Building and starting services..."
docker-compose down --volumes --remove-orphans
docker-compose build --no-cache
docker-compose up -d

# Wait for services to be ready
print_status "Waiting for services to be ready..."
sleep 30

# Check if services are healthy
print_status "Checking service health..."
if docker-compose ps | grep -q "unhealthy"; then
    print_error "Some services are unhealthy. Check logs with: docker-compose logs"
    exit 1
fi

print_success "All services are healthy!"

# Run database migrations
print_status "Running database migrations..."
docker-compose exec web python manage.py migrate

# Collect static files
print_status "Collecting static files..."
docker-compose exec web python manage.py collectstatic --noinput

# Create superuser if it doesn't exist
print_status "Creating superuser..."
docker-compose exec web python manage.py shell -c "
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@nuraleyn.com', 'admin123')
    print('Superuser created: admin/admin123')
else:
    print('Superuser already exists')
"

# Populate sample data
print_status "Populating sample data..."
docker-compose exec web python manage.py populate_sample_data

print_success "Deployment completed successfully!"
echo ""
echo "🌐 Access your NUR-AL-EYN Hospital Management System:"
echo "   • Main site: https://localhost"
echo "   • Admin panel: https://localhost/admin"
echo "   • Login credentials: admin/admin123"
echo ""
echo "📊 System Information:"
echo "   • Database: PostgreSQL (port 5432)"
echo "   • Cache: Redis (port 6379)"
echo "   • Web server: Nginx + Gunicorn"
echo "   • SSL: Self-signed certificate"
echo ""
echo "🔧 Useful Commands:"
echo "   • View logs: docker-compose logs -f"
echo "   • Stop services: docker-compose down"
echo "   • Restart services: docker-compose restart"
echo "   • Update application: ./deploy.sh"
echo ""
print_success "NUR-AL-EYN Hospital is now ready to serve patients! 🏥" 