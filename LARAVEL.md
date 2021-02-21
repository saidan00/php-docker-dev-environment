# Chạy composer và npm để cài đặt các gói cần thiết trong dự án
`composer install`
`npm install`

# Tạo database và config database, sau đó thực hiện lệnh sau để copy ra file env
`cp .env.example .env`

# Tạo ra key cho dự án
`php artisan key:generate`

# Tạo ra các bảng và dữ liệu mẫu cho database
`php artisan migrate`
`php artisan db:seed`

# Xây dựng các styles và scripts
`npm run <command>`

# Storage:link
`php artisan storage:link`
