# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
WX_GTK_VER=3.2-gtk3
inherit wxwidgets xdg desktop

DESCRIPTION="FreeFileSync is a folder comparison and synchronization software that creates and manages backup copies of all your important files. Instead of copying every file every time, FreeFileSync determines the differences between a source and a target folder and transfers only the minimum amount of data needed. FreeFileSync is Open Source software, available for Windows, macOS, and Linux."
HOMEPAGE="https://freefilesync.org/"
SRC_URI="https://github.com/hkneptune/FreeFileSync/archive/refs/tags/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sys-libs/zlib
	net-misc/curl
	dev-libs/openssl
	net-libs/libssh2
	>=x11-libs/gtk+-3
	x11-libs/wxGTK:${WX_GTK_VER}[X]
	dev-libs/boost
	app-arch/unzip"
	
RDEPEND="${DEPEND}"

S="${WORKDIR}"/FreeFileSync-${PV}

src_prepare(){

	setup-wxwidgets

	unzip FreeFileSync/Build/Resources/Icons.zip FreeFileSync.png -d FreeFileSync/Build
	unzip FreeFileSync/Build/Resources/Icons.zip RealTimeSync.png -d FreeFileSync/Build
	
	echo '[Desktop Entry]
Type=Application
Name=FreeFileSync
Exec=/opt/FreeFileSync/Bin/FreeFileSync_x86_64 %F
Icon=FreeFileSync
Terminal=false
Categories=Utility;FileTools;Archiving;
StartupNotify=true
MimeType=application/x-freefilesync-gui;application/x-freefilesync-batch;
Comment=Folder Comparison and Synchronization
Comment[ar]=مقارنة ومزامنة المجلدات
Comment[bg]=Сравняване и синхронизация на папки
Comment[cs]=porovnání a synchronizace složek
Comment[da]=Mappesammenligning og synkronisering
Comment[de]=Ordnervergleich und Synchronisation
Comment[el]=Σύγκριση Φακέλων και Συγχρονισμός
Comment[en_GB]=Folder Comparison and Synchronisation
Comment[es]=Comparación y sincronización de carpetas
Comment[fi]=Hakemistojen vertailu ja synkronointi
Comment[fr]=Comparaison de dossiers et Synchronisation
Comment[he]=סנכרון קבצים ותיקיות
Comment[hi]=निर्देशिका तुलना और सिंक्रनाइज़ेशन
Comment[hr]=Usporedba i sinkronizacija mapa
Comment[hu]=Mappa összehasonlítás és szinkronizálás
Comment[it]=Comparazione delle Cartelle e Sincronizzazione
Comment[ja]=フォルダの比較と同期
Comment[ko]=폴더 비교 및 동기화
Comment[lt]=Aplankų Palyginimas ir Suvienodinimas
Comment[nl]=Map vergelijken en synchroniseren
Comment[no]=Mappe-sammenligning og synkronisering
Comment[pl]=Porównywanie i Synchronizacja folderów
Comment[pt]=Comparação e Sincronização de Pastas
Comment[pt_BR]=Comparação e Sincronização de Pastas
Comment[ro]=Comparație și sincronizare a directoarelor
Comment[ru]=Сравнение и синхронизация
Comment[sk]=Porovnanie a synchronizácia priečinkov
Comment[sl]=Primerjava in sinhronizacija mape
Comment[sv]=Mappjämförelse och synkronisering
Comment[tr]=Klasör karşılaştırma ve eşitleme
Comment[uk]=Порівнювання та Синхронізація папок
Comment[vi]=So sánh và đồng bộ hóa thư mục
Comment[zh]=文件夹比较与同步
Comment[zh_TW]=資料夾比對和同步' > FreeFileSync/Build/FreeFileSync.desktop

	echo '[Desktop Entry]
Type=Application
Name=RealTimeSync
Exec=/opt/FreeFileSync/Bin/RealTimeSync_x86_64 %F
Icon=RealTimeSync
Terminal=false
Categories=Utility;FileTools;Archiving;
StartupNotify=true
MimeType=application/x-freefilesync-real;
Comment=Automated Synchronization
Comment[ar]=المزامنة التلقائية
Comment[bg]=Автоматична синхронизация
Comment[cs]=Automatická synchronizace
Comment[da]=Automatisk synkronisering
Comment[de]=Automatisierte Synchronisation
Comment[el]=Αυτοματοποιημένος Συγχρονισμός
Comment[en_GB]=Automated Synchronisation
Comment[es]=Sincronización Automática
Comment[fi]=Automaattinen synkronointi
Comment[fr]=Synchronisation Automatique
Comment[he]=סנכרון אוטומטי
Comment[hi]=स्वचालित सिंक्रनाइज़ेशन
Comment[hr]=Automatska Sinkronizacija
Comment[hu]=Automatizált szinkronizálás
Comment[it]=Sincronizzazione automatizzata
Comment[ja]=自動同期
Comment[ko]=자동 동기화
Comment[lt]=Automatinis Suvienodinimas
Comment[nl]=Automatische synchronisatie
Comment[no]=Automatisk synkronisering
Comment[pl]=Automatyczna synchronizacja
Comment[pt]=Sincronização Automática
Comment[pt_BR]=Sincronização Automatizada
Comment[ro]=Sincronizare Automată
Comment[ru]=Автоматическая синхронизация
Comment[sk]=Automatická synchronizácia
Comment[sl]=Samodejna sinhronizacija
Comment[sv]=Automatiserad synkronisering
Comment[tr]=Otomatik eşitleme
Comment[uk]=Автоматична Синхронізація
Comment[vi]=Đồng bộ tự động
Comment[zh]=自动同步
Comment[zh_TW]=自動化同步' > FreeFileSync/Build/RealTimeSync.desktop

default
}


src_configure() {

sed -i '21i\
#define MAX_SFTP_OUTGOING_SIZE 30000\n\
#define MAX_SFTP_READ_SIZE 30000' FreeFileSync/Source/afs/sftp.cpp

sed -i '34i\
#define wxUSE_EXCEPTIONS 0' FreeFileSync/Source/application.cpp

sed -i '23i\
LDFLAGS += `pkg-config --libs   gtk+-3.0`' FreeFileSync/Source/Makefile
sed -i 's|gtk+-2.0|gtk+-3.0|g' FreeFileSync/Source/Makefile
sed -i 's|#treat as system headers so that warnings are hidden:|LDFLAGS += `pkg-config --libs   zlib`|g' FreeFileSync/Source/Makefile
sed -i 's|gtk-2.0|gtk-3.0|g' FreeFileSync/Source/Makefile

sed -i '26i\
#define wxUSE_EXCEPTIONS 0' FreeFileSync/Source/RealTimeSync/application.cpp

sed -i '14i\
LDFLAGS += `pkg-config --libs   gtk+-3.0`' FreeFileSync/Source/RealTimeSync/Makefile

sed -i 's|gtk+-2.0|gtk+-3.0|g' FreeFileSync/Source/RealTimeSync/Makefile
sed -i 's|#treat as system headers so that warnings are hidden:|LDFLAGS += `pkg-config --libs   zlib`|g' FreeFileSync/Source/RealTimeSync/Makefile
sed -i 's|gtk-2.0|gtk-3.0|g' FreeFileSync/Source/RealTimeSync/Makefile

sed -i 's|::g_object_ref(gicon)|g_object_ref(gicon)|g' FreeFileSync/Source/base/icon_loader.cpp
	
}

src_compile(){
	cd ${S}/FreeFileSync/Source
	emake
	cd ${S}/FreeFileSync/Source/RealTimeSync
	emake
}

src_install() {

	insinto /opt/FreeFileSync
	doins -r FreeFileSync/Build/Resources
	doins -r FreeFileSync/Build/Bin
	
	fperms 0755 /opt/FreeFileSync/Bin/FreeFileSync_x86_64
	fperms 0755 /opt/FreeFileSync/Bin/RealTimeSync_x86_64
	
	doicon -s scalable FreeFileSync/Build/FreeFileSync.png
	doicon -s scalable FreeFileSync/Build/RealTimeSync.png
	
	domenu FreeFileSync/Build/FreeFileSync.desktop
	domenu FreeFileSync/Build/RealTimeSync.desktop
}
