require "formula"

class Kf5Knewstuff < Formula
  version "5.39.0"
  url "https://download.kde.org/stable/frameworks/#{version}/knewstuff-#{version}.tar.xz"
  sha256 "3925f2417e35f5dfa9d2dc1d8059233467569af915b2c0266ea62d6fd2a6aeaa"
  desc "Support for downloading application assets from the network"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/knewstuff.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"
  depends_on "KDE-mac/kde/kf5-kio"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
