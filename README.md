# NUR-AL-EYN Hospital Management System

A comprehensive, production-ready hospital management system built with Django, featuring a modern medical theme with professional healthcare branding. NUR-AL-EYN Hospital is a leading healthcare institution committed to providing world-class medical services with over 25 years of excellence.

## 🌟 Features

- **🏥 Professional Medical Theme**: Modern healthcare design with medical color schemes and professional branding
- **👥 Complete Patient Management**: Comprehensive patient records, medical history, and insurance tracking
- **👨‍⚕️ Doctor Management**: Specialist profiles with qualifications, experience, and department assignments
- **📅 Advanced Appointment System**: Smart scheduling with status tracking and automated reminders
- **💊 Treatment Records**: Complete treatment tracking with prescriptions, billing, and follow-up scheduling
- **🏢 Department & Services**: Organized hospital departments with specialized medical services
- **🚨 Emergency Services**: 24/7 emergency request handling with rapid response system
- **📊 Admin Dashboard**: Comprehensive analytics and hospital management interface
- **📱 Responsive Design**: Mobile-first design optimized for all devices
- **🎨 Modern UI/UX**: Beautiful animations, interactive elements, and professional styling

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd hospital_management
   ```

2. **Create and activate virtual environment**
   ```bash
   python -m venv venv
   # On Windows
   venv\Scripts\activate
   # On macOS/Linux
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run migrations**
   ```bash
   python manage.py migrate
   ```

5. **Populate sample data (recommended)**
   ```bash
   python manage.py populate_sample_data
   ```

6. **Collect static files**
   ```bash
   python manage.py collectstatic --noinput
   ```

7. **Run the development server**
   ```bash
   python manage.py runserver
   ```

8. **Access the application**
   - Main site: http://127.0.0.1:8000/
   - Admin panel: http://127.0.0.1:8000/admin/
   - Login credentials: admin/admin123

## 📁 Project Structure

```
hospital_management/
├── core/                          # Main application
│   ├── models.py                  # Database models
│   ├── views.py                   # View functions
│   ├── urls.py                    # URL routing
│   ├── forms.py                   # Django forms
│   ├── admin.py                   # Admin interface
│   ├── management/                # Custom management commands
│   └── templates/core/            # HTML templates
├── static/                        # Static files
│   ├── css/                       # Stylesheets
│   ├── js/                        # JavaScript files
│   ├── images/                    # Images and icons
│   └── videos/                    # Video files
├── templates/                     # Base templates
├── hms/                          # Project settings
└── manage.py                     # Django management script
```

## 🏥 System Modules

### Patient Management
- Complete patient registration and profiles
- Medical history tracking and updates
- Contact information and address management
- Insurance details and coverage tracking
- Patient search and filtering

### Doctor Management
- Specialist profiles with qualifications
- Department assignments and specializations
- Experience tracking and certifications
- Contact information and availability
- Doctor search and filtering

### Appointment System
- Smart appointment scheduling
- Status tracking (Scheduled, Completed, Cancelled)
- Patient-doctor assignments
- Appointment notes and reminders
- Calendar integration

### Treatment Records
- Comprehensive diagnosis tracking
- Prescription management
- Treatment costs and billing
- Payment tracking and methods
- Follow-up scheduling

### Hospital Services
- Department management and organization
- Service catalog with descriptions
- Emergency services coordination
- Contact information and hours
- Service availability tracking

## 🎨 Design Features

- **Medical Color Scheme**: Professional healthcare colors (blues, greens, reds)
- **Modern Typography**: Clean, readable fonts optimized for medical content
- **Responsive Layout**: Mobile-first design approach
- **Interactive Elements**: Hover effects, animations, and transitions
- **Bootstrap 5**: Latest Bootstrap framework for consistent styling
- **Custom CSS**: Enhanced medical theme with professional animations
- **Accessibility**: WCAG compliant design for all users

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the project root:
```env
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
DATABASE_URL=your-database-url
```

### Database Configuration
The system uses SQLite by default. For production, configure your preferred database in `settings.py`:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'nuraleyn_hospital',
        'USER': 'your_username',
        'PASSWORD': 'your_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

## 📊 Sample Data

The system includes comprehensive sample data for NUR-AL-EYN Hospital:
```bash
python manage.py populate_sample_data
```

This creates:
- **10 Hospital Departments** (Emergency, Cardiology, Pediatrics, etc.)
- **40+ Medical Services** across all departments
- **10 Specialist Doctors** with realistic Kenyan names
- **12 Patients** with complete medical profiles
- **25 Sample Appointments** with various statuses
- **Treatment Records** for completed appointments

## 🔒 Security Features

- CSRF protection enabled
- XSS protection headers
- Secure content type sniffing
- Frame options protection
- Password validation and hashing
- Login required decorators
- Session security
- SQL injection prevention

## 🚨 Emergency Features

- Emergency request form with validation
- 24/7 contact information display
- Quick access to emergency services
- Ambulance request system
- Emergency contact numbers
- Rapid response coordination

## 📱 Mobile Responsiveness

The system is fully responsive and optimized for:
- Desktop computers and laptops
- Tablets and iPads
- Mobile phones (iOS/Android)
- Touch devices and tablets
- All screen sizes and orientations

## 🛠️ Development

### Running Tests
```bash
python manage.py test
```

### Creating Migrations
```bash
python manage.py makemigrations
```

### Applying Migrations
```bash
python manage.py migrate
```

### Static Files
```bash
python manage.py collectstatic
```

### Creating Superuser
```bash
python manage.py createsuperuser
```

## 🚀 Deployment

### Production Deployment
1. Set `DEBUG = False` in settings
2. Configure production database
3. Set up static file serving
4. Configure environment variables
5. Set up SSL certificate
6. Configure web server (Nginx/Apache)
7. Set up process manager (Gunicorn)

### Docker Deployment
```bash
# Build Docker image
docker build -t nuraleyn-hospital .

# Run container
docker run -p 8000:8000 nuraleyn-hospital
```

## 📞 Support & Contact

For support and questions:
- **Email**: support@nuraleyn.com
- **Phone**: +254 700 000 000
- **WhatsApp**: +254 712 345 678
- **Address**: Nairobi, Kenya
- **Emergency**: +254 700 000 000

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🏥 About NUR-AL-EYN Hospital

NUR-AL-EYN Hospital is a leading healthcare institution committed to providing world-class medical services to all patients. With over 25 years of excellence, we serve our community with:

- **Compassion**: Patient-centered care approach
- **Innovation**: Latest medical technology and procedures
- **Excellence**: Highest standards of medical care
- **Accessibility**: Services available to all communities
- **Professionalism**: Experienced medical professionals

Our modern facilities, experienced medical professionals, and compassionate care make us a leading healthcare provider in Nairobi and beyond.

## 🌟 Key Highlights

- **25+ Years of Excellence** in healthcare service
- **50+ Specialist Doctors** across all medical fields
- **100,000+ Happy Patients** served
- **24/7 Emergency Services** available
- **15+ Medical Departments** with specialized care
- **State-of-the-art Facilities** and equipment
- **International Standards** of medical care
- **Patient-Centered Approach** to healthcare

---

**Built with ❤️ for NUR-AL-EYN Hospital - Excellence in Healthcare** 