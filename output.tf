output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}
output "kube_main_public_ip" {
  value = aws_instance.master.public_ip
}
output "kube_main_private_ip" {
  value = aws_instance.master.private_ip
}
output "kube_worker_1_public_ip" {
  value = aws_instance.worker1.public_ip
}
output "kube_worker_1_private_ip" {
  value = aws_instance.worker1.private_ip
}
output "kube_worker_2_public_ip" {
  value = aws_instance.worker2.public_ip
}
output "kube_worker_2_private_ip" {
  value = aws_instance.worker2.private_ip
}
output "docker_public_ip" {
  value = aws_instance.docker.public_ip
}
output "docker_private_ip" {
  value = aws_instance.docker.private_ip
}
output "grafana_public_ip" {
  value = aws_instance.grafana.public_ip
}
output "grafana_private_ip" {
  value = aws_instance.grafana.private_ip
}
output "prometheus_public_ip" {
  value = aws_instance.prometheus.public_ip
}
output "prometheus_private_ip" {
  value = aws_instance.prometheus.private_ip
}