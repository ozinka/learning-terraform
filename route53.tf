resource "aws_route53_record" "ksharing-www" {
  name    = "ksharing.iplatinum.pro"
  type    = "A"
  ttl     = 60
  zone_id = "ZMRAPSUGXMY0J"
  records = [aws_instance.web_server.public_ip]
}