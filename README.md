# Mathcha Edu - Backend (SWP391_Server)

## Giới thiệu
Mathcha Edu là hệ thống API Backend cung cấp nền tảng học Toán dành cho học sinh tiểu học. Hệ thống hỗ trợ quản lý khóa học, bài giảng, bài kiểm tra (quiz), theo dõi tiến độ học tập và quản lý lịch sử giao dịch.

## Các chức năng chính
* **Xác thực & Phân quyền (Auth & Security):** Đăng nhập/Đăng ký sử dụng JWT. Phân quyền chặt chẽ với các role: `ADMIN`, `MANAGER`, `CONTENT_MANAGER`, `PARENT`, và `STUDENT`.
* **Quản lý Khóa học (Course Management):** Quản lý cấu trúc phân cấp: Danh mục (Category) -> Khóa học (Course) -> Chương (Chapter) -> Chủ đề (Topic) -> Bài học (Lesson).
* **Hệ thống Bài tập & Kiểm tra (Quiz & Questions):** * Tạo bài kiểm tra ngẫu nhiên theo Chủ đề, Chương hoặc Khóa học.
    * Đánh giá và chấm điểm tự động.
    * Hỗ trợ Import/Export kho câu hỏi bằng file Excel.
* **Quản lý Giao dịch & Học tập:** * Quản lý thông tin thanh toán và lịch sử đăng ký khóa học của phụ huynh.
    * Theo dõi tiến độ hoàn thành bài học/chương của học sinh (Enrollment & Progress).
* **Thống kê & Báo cáo (Dashboard/Chart):** Thống kê doanh thu theo ngày/tháng/năm và số lượng người dùng mua khóa học dành cho cấp quản lý.

## 🛠️ Công nghệ sử dụng
* **Ngôn ngữ:** Java 17
* **Framework:** Spring Boot 3.2.6
* **Bảo mật:** Spring Security, OAuth2, JWT (JSON Web Token)
* **Cơ sở dữ liệu:** MySQL (Sử dụng Spring Data JPA / Hibernate)
* **Tài liệu API:** Swagger UI / OpenAPI 3
* **Tiện ích khác:** Apache POI (Xử lý Excel), Lombok

## ⚙️ Yêu cầu hệ thống (Prerequisites)
* [JDK 17](https://adoptium.net/) trở lên.
* [Maven](https://maven.apache.org/) 3.x.
* MySQL Server.

## Cài đặt & Chạy dự án (Local Development)

1. **Clone repository:**
   ```bash
   git clone <repo_url>
   cd Mathcha.edu_Back-end
   ```

2. **Cấu hình biến môi trường:**
   Hệ thống sử dụng các biến môi trường để bảo mật thông tin. Bạn có thể cấu hình trực tiếp trong IDE hoặc export vào OS. Nếu không có biến môi trường, ứng dụng sẽ lấy giá trị mặc định trong `src/main/resources/application.properties`:
   * `DB_URL` (Mặc định: `jdbc:mysql://localhost:3306/test1`)
   * `DB_USERNAME` (Mặc định: `root`)
   * `DB_PASSWORD` (Mặc định: `123456`)
   * `JWT_SECRET_KEY` (Khóa mã hóa token JWT)

3. **Build dự án:**
   ```bash
   ./mvnw clean package -DskipTests
   ```

4. **Chạy ứng dụng:**
   ```bash
   ./mvnw spring-boot:run
   ```
   *Server sẽ chạy ở cổng mặc định: `http://localhost:8080`*

## Triển khai với Docker (Deployment)

Dự án đã có sẵn `Dockerfile`. Bạn có thể dễ dàng đóng gói và chạy ứng dụng trên bất kỳ server nào có Docker:

```bash
# Build image
docker build -t mathcha-edu-backend .

# Run container 
# Lưu ý: Cổng trong Dockerfile hiện đang được set là 10000
docker run -d -p 10000:10000 --name mathcha-backend mathcha-edu-backend
```

## Tài liệu API (API Documentation)
Dự án sử dụng Swagger để tự động tạo tài liệu API. Sau khi khởi chạy ứng dụng thành công (chạy local mặc định ở port 8080), bạn có thể truy cập danh sách API và test trực tiếp tại:
* **Swagger UI:** `http://localhost:8080/swagger-ui/index.html`
* **OpenAPI Specs:** `http://localhost:8080/v3/api-docs`

## Tài khoản mặc định ban đầu
*Khi ứng dụng khởi chạy lần đầu tiên, nếu database trống, hệ thống sẽ tự động tạo một tài khoản Admin mặc định để bạn thao tác:*
* **Username:** `admin`
* **Password:** `admin`

---
*Dự án được phát triển cho hệ thống giáo dục trực tuyến Mathcha Edu.*
