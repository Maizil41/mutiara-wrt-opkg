<h1 align="center">
  MUTIARA-WRT CUSTOM OPKG REPOSITORY
</h1>

</br>

Repository ini berisi ipk hasil compile disaat gabut, `(mungkin)` ada beberapa ipk yang berguna

</br>

Cara pasang : Copy paste di `Terminal`

```
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf
echo "src/gz mutiara_wrt https://raw.githubusercontent.com/maizil41/mutiara-wrt-opkg/main/generic" >> /etc/opkg/customfeeds.conf
```
