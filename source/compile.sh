# Clone repository and get latest commit
cd ${DATA_DIR}
git clone https://github.com/jinlife/unraid-r8125-r8152-driver
cd ${DATA_DIR}/unraid-r8125-r8152-driver
PLUGIN_VERSION="$(git log -1 --format="%cs" | sed 's/-//g')"
git checkout main

# Compile r8125 Kernel Module and install it to the temporary directory "/RTL8125"
cd ${DATA_DIR}/unraid-r8125-r8152-driver/r8125/src

make -j${CPU_COUNT}
make INSTALL_MOD_PATH=/RTL8125 install -j${CPU_COUNT}

# Remove non Kernel modules from temporary directory
rm /RTL8125/lib/modules/${UNAME}/* 2>/dev/null

# Create Slackware package
PLUGIN_NAME="r8125"
BASE_DIR="/RTL8125"
TMP_DIR="/tmp/${PLUGIN_NAME}_"$(echo $RANDOM)""
VERSION="$(date +'%Y.%m.%d')"

mkdir -p $TMP_DIR/$VERSION
cd $TMP_DIR/$VERSION
cp -R $BASE_DIR/* $TMP_DIR/$VERSION/
mkdir $TMP_DIR/$VERSION/install
tee $TMP_DIR/$VERSION/install/slack-desc <<EOF
       |-----handy-ruler------------------------------------------------------|
$PLUGIN_NAME: $PLUGIN_NAME OOT driver by jinlife
$PLUGIN_NAME:
$PLUGIN_NAME: Source: https://github.com/jinlife/unraid-r8125-r8152-driver
$PLUGIN_NAME:
$PLUGIN_NAME: Custom $PLUGIN_NAME driver package for Unraid Kernel v${UNAME%%-*} by ich777
$PLUGIN_NAME:
EOF
${DATA_DIR}/bzroot-extracted-$UNAME/sbin/makepkg -l n -c n $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz
md5sum $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz | awk '{print $1}' > $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz.md5


# Compile r8152 Kernel Module and install it to the temporary directory "/RTL8152"
cd ${DATA_DIR}/unraid-r8125-r8152-driver/r8152/src

make -j${CPU_COUNT}
make INSTALL_MOD_PATH=/RTL8152 install -j${CPU_COUNT}

# Remove non Kernel modules from temporary directory
rm /RTL8152/lib/modules/${UNAME}/* 2>/dev/null


# Create Slackware package
PLUGIN_NAME="r8152"
BASE_DIR="/RTL8152"
TMP_DIR="/tmp/${PLUGIN_NAME}_"$(echo $RANDOM)""
VERSION="$(date +'%Y.%m.%d')"

mkdir -p $TMP_DIR/$VERSION
cd $TMP_DIR/$VERSION
cp -R $BASE_DIR/* $TMP_DIR/$VERSION/
mkdir $TMP_DIR/$VERSION/install
tee $TMP_DIR/$VERSION/install/slack-desc <<EOF
       |-----handy-ruler------------------------------------------------------|
$PLUGIN_NAME: $PLUGIN_NAME OOT driver by jinlife
$PLUGIN_NAME:
$PLUGIN_NAME: Source: https://github.com/jinlife/unraid-r8125-r8152-driver
$PLUGIN_NAME:
$PLUGIN_NAME: Custom $PLUGIN_NAME driver package for Unraid Kernel v${UNAME%%-*} by ich777
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
EOF
${DATA_DIR}/bzroot-extracted-$UNAME/sbin/makepkg -l n -c n $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz
md5sum $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz | awk '{print $1}' > $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz.md5

# Compile r8168 Kernel Module and install it to the temporary directory "/RTL8168"
cd ${DATA_DIR}/unraid-r8125-r8152-driver/r8168/src

make -j${CPU_COUNT}
make INSTALL_MOD_PATH=/RTL8168 install -j${CPU_COUNT}

# Remove non Kernel modules from temporary directory
rm /RTL8168/lib/modules/${UNAME}/* 2>/dev/null


# Create Slackware package
PLUGIN_NAME="r8168"
BASE_DIR="/RTL8168"
TMP_DIR="/tmp/${PLUGIN_NAME}_"$(echo $RANDOM)""
VERSION="$(date +'%Y.%m.%d')"

mkdir -p $TMP_DIR/$VERSION
cd $TMP_DIR/$VERSION
cp -R $BASE_DIR/* $TMP_DIR/$VERSION/
mkdir $TMP_DIR/$VERSION/install
tee $TMP_DIR/$VERSION/install/slack-desc <<EOF
       |-----handy-ruler------------------------------------------------------|
$PLUGIN_NAME: $PLUGIN_NAME OOT driver by jinlife
$PLUGIN_NAME:
$PLUGIN_NAME: Source: https://github.com/jinlife/unraid-r8125-r8152-driver
$PLUGIN_NAME:
$PLUGIN_NAME: Custom $PLUGIN_NAME driver package for Unraid Kernel v${UNAME%%-*} by ich777
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
$PLUGIN_NAME:
EOF
${DATA_DIR}/bzroot-extracted-$UNAME/sbin/makepkg -l n -c n $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz
md5sum $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz | awk '{print $1}' > $TMP_DIR/$PLUGIN_NAME-$PLUGIN_VERSION-$UNAME-1.txz.md5

