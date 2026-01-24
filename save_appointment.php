<?php
header('Content-Type: application/json');
include 'config.php';

if ($_POST) {
    $patient_name = $_POST['patient_name'];
    $doctor_id = $_POST['doctor_id'];
    $appointment_date = $_POST['appointment_date'];
    $time_slot = $_POST['time_slot'];
    $phone = $_POST['phone'];
    
    try {
        $stmt = $pdo->prepare("INSERT INTO appointments (patient_name, doctor_id, appointment_date, time_slot, phone, status) VALUES (?, ?, ?, ?, ?, 'booked')");
        $stmt->execute([$patient_name, $doctor_id, $appointment_date, $time_slot, $phone]);
        
        echo json_encode([
            'success' => true, 
            'message' => 'Appointment booked successfully!'
        ]);
    } catch (Exception $e) {
        echo json_encode([
            'success' => false, 
            'message' => 'Booking failed: ' . $e->getMessage()
        ]);
    }
} else {
    echo json_encode([
        'success' => false, 
        'message' => 'No data received'
    ]);
}
exit;
?>
