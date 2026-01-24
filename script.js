document.addEventListener('DOMContentLoaded', function() {
    loadDoctors();
    loadForm();
    initNavbar();
});

async function loadDoctors() {
    const container = document.getElementById('doctorsContainer');
    try {
        const response = await fetch('get_doctors.php');
        const doctors = await response.json();
        
        container.innerHTML = '';
        
        doctors.slice(0, 12).forEach(doctor => {
            container.innerHTML += `
                <div class="doctor-card">
                    <h3>${doctor.doctor_name}</h3>
                    <p><strong>${doctor.specialization}</strong></p>
                    <p>⭐ ${doctor.rating}</p>
                </div>
            `;
        });
    } catch (error) {
        container.innerHTML = '<div class="loading-card"><i class="fas fa-exclamation-triangle"></i><p>Error loading doctors</p></div>';
    }
}

function loadForm() {
  
    const timeSelect = document.getElementById('timeSelect');
    const times = ['09:00 AM','10:00 AM','11:00 AM','12:00 PM','02:00 PM','03:00 PM','04:00 PM','05:00 PM','06:00 PM'];
    
    timeSelect.innerHTML = '<option value="">Select Time</option>';
    times.forEach(time => {
        const option = document.createElement('option');
        option.value = time;
        option.textContent = time;
        timeSelect.appendChild(option);
    });

    loadFormDoctors();

  
    document.getElementById('appointmentForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        const btn = e.target.querySelector('.submit-btn');
        const originalText = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Booking...';
        btn.disabled = true;

        try {
            const formData = new FormData(e.target);
            const response = await fetch('save_appointment.php', {
                method: 'POST',
                body: formData
            });
            const result = await response.json();

            if (result.success) {
                alert('✅ ' + result.message);
                e.target.reset();
                loadFormDoctors();
            } else {
                alert('❌ ' + result.message);
            }
        } catch (error) {
            alert('❌ Connection error');
        }
        btn.innerHTML = originalText;
        btn.disabled = false;
    });
}

async function loadFormDoctors() {
    const doctorSelect = document.getElementById('doctorSelect');
    try {
        const response = await fetch('get_doctors.php');
        const doctors = await response.json();
        
        doctorSelect.innerHTML = '<option value="">Select Doctor</option>';
        doctors.forEach(doctor => {
            const option = document.createElement('option');
            option.value = doctor.doctor_id;
            option.textContent = `${doctor.doctor_name} - ${doctor.specialization}`;
            doctorSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Form doctors error:', error);
    }
}

function initNavbar() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    
    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        navMenu.classList.toggle('active');
    });
}
