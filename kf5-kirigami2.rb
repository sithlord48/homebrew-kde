require "formula"

class Kf5Kirigami2 < Formula
  version "5.39.0"
  url "https://download.kde.org/stable/frameworks/#{version}/kirigami2-#{version}.tar.xz"
  sha256 "2714ee82dbcc2cd1b799d5f12193cae5637136466295567426c74b4f26f5ef6a"
  desc "A QtQuick based components set"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kirigami2.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
