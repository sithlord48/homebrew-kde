class Atelier < Formula
  desc "3D printing host"
  homepage "https://atelier.kde.org"
  ##ONLY BUILD HEAD UNTIL RELEASE
  #FIX URL AFTER RELEASE.
  url "https://download.kde.org/stable/atcore/1.0.0/atcore-1.0.0.tar.xz"
  sha256 "ffd12455c9b8db853e455a437d6c6b601e0003c6732bbc6c2828032e004530e2"

  head "git://anongit.kde.org/atelier.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/atcore"
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/kf5-kconfigwidgets"
  depends_on "KDE-mac/kde/kf5-ki18n" 
  depends_on "KDE-mac/kde/kf5-knewstuff"
  depends_on "KDE-mac/kde/kf5-ktexteditor"
  depends_on "KDE-mac/kde/kf5-kxmlgui"

  def install

    args = std_cmake_args
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
