<?php
header('Content-Type: application/json');
include 'config.php';

try {
  
    $stmt = $pdo->query("
        SELECT a.*, d.doctor_name, d.specialization 
        FROM appointments a 
        LEFT JOIN doctors d ON a.doctor_id = d.doctor_id 
        ORDER BY a.id DESC
    ");
    $appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($appointments);
} catch (Exception $e) {
    echo json_encode([]);
}
exit;
?>
