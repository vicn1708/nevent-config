![nevent](https://)

# Xây dựng môi trường cho VPS

## 1. Thêm user vào sudo group

```shell
su - ${user}
group
```

## 2. Đối với VPS mới khởi tạo

Chạy lệnh sau để setup môi trường web service:

```shell
bash config.sh
```

## 3. Đối với VPS đã thuê và đã chạy lệnh `bash config.sh` muốn chạy pipeline CI - CD

Chạy lệnh sau:

```shell
bash deploy.sh
```
