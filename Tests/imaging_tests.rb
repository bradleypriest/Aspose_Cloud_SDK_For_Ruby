# Copyright (c) Aspose 2002-2014. All Rights Reserved.
#
# LICENSE: This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://opensource.org/licenses/gpl-3.0.html>;.
#
# @package Aspose_Cloud_SDK_For_Ruby
# @author  Assad Mahmood Qazi <assad.mahmood@aspose.com>
# @link    https://github.com/asposeforcloud/Aspose_Cloud_SDK_For_Ruby/tree/revamp

require 'test/unit'
require_relative '../lib/asposecloud'

class ImagingTests < Test::Unit::TestCase

  def setup
    file = File.read('setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end


  def test_convert_local_file
    # Create object of imaging converter class
    converter = Aspose::Cloud::Imaging::Converter.new('barcodeQR.png')

    converter.convert_local_file('./data/barcodeQR.png','./output/barcodeQR.bmp','bmp')
    assert_equal true, File.exist?('./output/barcodeQR.jpg')
  end

  def test_get_properties

    # Create object of imaging document class
    document = Aspose::Cloud::Imaging::Document.new('barcodeQR.png')
    response = document.get_properties()
    assert_kind_of(Hash, response)

  end

  def test_update_bmp_properties

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/barcodeQR.bmp'

    document = Aspose::Cloud::Imaging::Document.new('barcodeQR.bmp')
    response = document.update_bmp_properties(24,100,100,'/')

    assert_equal true, File.exist?('./output/barcodeQR_updated.bmp')

  end

  def test_update_bmp_properties_local

    document = Aspose::Cloud::Imaging::Document.new('barcodeQR.bmp')
    response = document.update_bmp_properties_local('./data/barcodeQR.bmp',24,100,100)

    assert_equal true, File.exist?('./output/barcodeQR_updated.bmp')

  end

  def test_update_gif_properties

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/macbook.gif'

    document = Aspose::Cloud::Imaging::Document.new('macbook.gif')
    response = document.update_gif_properties(32,3,true,'/')

    assert_equal true, File.exist?('./output/macbook_updated.gif')

  end

  def test_update_gif_properties_local

    document = Aspose::Cloud::Imaging::Document.new('macbook.gif')
    response = document.update_gif_properties_local('./data/macbook.gif',32,3,true)

    assert_equal true, File.exist?('./output/macbook_updated.gif')

  end

  def test_update_jpg_properties

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/barcodeQR.jpg'

    document = Aspose::Cloud::Imaging::Document.new('barcodeQR.jpg')
    response = document.update_jpg_properties(45,'baseline','/')

    assert_equal true, File.exist?('./output/barcodeQR_updated.jpg')

  end

  def test_update_jpg_properties_local

    document = Aspose::Cloud::Imaging::Document.new('barcodeQR.jpg')
    response = document.update_jpg_properties_local('./data/barcodeQR.jpg',45,'baseline')

    assert_equal true, File.exist?('./output/barcodeQR_updated.jpg')
  end

  def test_update_psd_properties

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/bizcard.psd'

    document = Aspose::Cloud::Imaging::Document.new('bizcard.psd')
    response = document.update_psd_properties(4,'raw','/')

    assert_equal true, File.exist?('./output/bizcard_updated.psd')

  end

  def test_update_psd_properties_local

    document = Aspose::Cloud::Imaging::Document.new('bizcard.psd')
    response = document.update_psd_properties_local('./data/bizcard.psd',4,'raw')

    assert_equal true, File.exist?('./output/bizcard_updated.psd')

  end


  def test_convert_tiff_to_fax

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/barcodeQR.tiff'

    converter = Aspose::Cloud::Imaging::Converter.new('barcodeQR.tiff')
    response = converter.convert_tiff_to_fax

    assert_equal true, File.exist?('./output/barcodeQR.tiff')

  end


  def test_resize_image

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/barcodeQR.png'

    image = Aspose::Cloud::Imaging::Image.new('barcodeQR.png')
    response = image.resize_image('./data/barcodeQR.png',10,10,'barcodeQR_resized.gif','gif')

    assert_equal true, File.exist?('./output/barcodeQR_resized.gif')

  end


  def test_crop_image

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/barcodeQR.png'

    image = Aspose::Cloud::Imaging::Image.new('barcodeQR.png')
    response = image.crop_image(0,0,10,10,'/','png')

    assert_equal true, File.exist?('./output/barcodeQR.png')

  end


  def test_rotate_image

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './data/barcodeQR.png'

    image = Aspose::Cloud::Imaging::Image.new('barcodeQR.png')
    response = image.rotate_image('rotate270flipnone','/','png')

    assert_equal true, File.exist?('./output/barcodeQR.png')

  end

end
