mkdir -p diy
svn co --force -q https://github.com/coolsnowwolf/lede/trunk/package/lean ../lean && svn revert -R ../lean && rm -rf ../lean/.svn && rm -rf ../lean/samba4 && rm -rf ../lean/luci-app-samba4 && rm -rf ../lean/luci-app-ttyd && rm -rf ../lean/luci-theme-argon && rm -rf ../lean/luci-app-dnsforwarder && rm -rf ../lean/dnsforwarder && rm -rf lean && mv ../lean ./ && echo "Lean更新成功" || echo "Lean暂无更新"
git clone --depth 1 https://github.com/fw876/helloworld.git ../helloworld && [ -e ../helloworld/luci-app-ssr-plus/Makefile ] && rm -rf ../helloworld/.git && rm -rf helloworld && mv ../helloworld . && echo "helloworld更新成功" || echo "helloworld暂无更新"
git clone --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git ../chinadns-ng && [ -e ../chinadns-ng/Makefile ] && rm -rf ../chinadns-ng/.git && rm -rf diy/chinadns-ng && cp -a ../chinadns-ng diy && echo "chinadns-ng更新成功" || echo "chinadns-ng暂无更新"
git clone --depth 1 https://github.com/kuoruan/luci-app-v2ray.git ../luci-app-v2ray && [ -e ../luci-app-v2ray/Makefile ] && rm -rf ../luci-app-v2ray/.git && rm -rf diy/luci-app-v2ray && cp -a ../luci-app-v2ray diy && echo "luci-app-v2ray更新成功" || echo "luci-app-v2ray暂无更新"
git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git ../luci-app-adguardhome && [ -e ../luci-app-adguardhome/Makefile ] && rm -rf ../luci-app-adguardhome/.git && rm -rf diy/luci-app-adguardhome && cp -a ../luci-app-adguardhome diy && echo "luci-app-adguardhome更新成功" || echo "luci-app-adguardhome暂无更新"
#更新AdGuardHome.yaml
wget https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf && \
sed -e 's|^server=/\(.*\)/114.114.114.114$$|\1|' accelerated-domains.china.conf | egrep -v '^#' > accelerated-domains.china.raw.txt && \
sed -i "s/server=/  - '[/g;s/114.114.114.114/]https:\/\/dns.alidns.com\/dns-query'/g" accelerated-domains.china.raw.txt && \
sed -i '/dns.alidns.com\/dns-query/d' config/AdGuardHome/AdGuardHome.yaml && \
sed -i '40r accelerated-domains.china.raw.txt' config/AdGuardHome/AdGuardHome.yaml && \
rm -rf accelerated* && echo "AdGuardHome.yaml更新成功" || echo "AdGuardHome.yaml暂无更新"
echo "======================="
git add . && git commit -m "$(date "+%Y%m%d-%H%M")" && git push && echo "更新完毕!!!" || echo "暂无更新!!!"
echo "======================="
