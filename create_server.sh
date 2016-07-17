# Собираем данные
echo "Введите имя пользователя"
read USERNAME
PASSWORD=$(date +%s | sha256sum | base64 | head -c 16 ; echo)

# Создаем пользователя
useradd -m $USERNAME
echo ${PASSWORD} | passwd ${USERNAME} --stdin


