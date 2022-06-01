#Kullanılacak base image
FROM node:14.17

# Çalışma alanıdır. Işlemler bu alan altında çalışır
WORKDIR /home/node/app/

# yapılacak işlemlerin root user'ına geçerek yapılmasını sağlar.
USER root
# Owner'ı burada tanımlanır. çalışma dizinin altındaki tüm file-folderlar'ın sahibinin node:node olması sağlanır.
RUN chown node:node /home/node -R

# Mevcut package.json yarn edilmeden önce özel olarak dizine atılmalıdır. Aksi halde indirme işlemi başarısız olmaktadır.
# Aynı şekilde yarn.lock ya da package.json.lock dosyası da varsa çalışma alanının dosyasına atılması gerekmektedir.
ADD --chown=node:node package.json package.json

# Bundan sonraki işlemlerin node kullanıcısı ile yapılmasını sağlar.
USER node
# package.json dosyasındaki gereksinimlerin install edilmesini sağlar.
RUN yarn
# İndirilen ve mevcutta olan tüm dosyaları node owner'ı ile çalışma alanındaki dizine eklenmesini sağlar.
ADD --chown=node:node . .
# Mevcut uygulamanın build alınmasını sağlayarak yayına çıkmak için hazır duruma getirilir.
RUN yarn build


# Kullanılacak image seçilir.
FROM nginx:1.17
# Projenin içerisindeki alınan build'in içerisindeki file'ları nginx.confda yayınlanması için çalışma alanına kopyalar
COPY --from=0 /home/node/app/build /etc/nginx/www/
# Yayınlanması için gerekli olan nginx.conf dosyasını file içerisine taşır
COPY nginx.conf /etc/nginx/nginx.conf
#  Nginx'in arkaplanda çalışması için gerekli bash komutudur.
CMD /bin/bash -c "exec nginx -g 'daemon off;'"