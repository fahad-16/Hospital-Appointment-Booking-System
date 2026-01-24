<?php
header('Content-Type: application/json');
include 'config.php';

try {
    $stmt = $pdo->query("SELECT doctor_id, doctor_name, specialization, rating FROM doctors ORDER BY doctor_name ASC");
    $doctors = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($doctors);
} catch (Exception $e) {
    echo json_encode([]);
}
exit;
?>
