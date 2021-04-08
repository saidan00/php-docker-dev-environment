Nếu ta dùng bind mount folder của host vào container (./drupal/drupal-data:/var/www/html), thì drupal sẽ lấy folder của host (rỗng) => không có source code

Để lấy source của drupal từ container về host, có 2 hướng:
- Ta dùng named volume => drupal-data:/var/www/html
- Ta sẽ copy thư mục /var/www/html trong container drupal vào thư mục ./drupal/drupal-data

