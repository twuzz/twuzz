# Twuzz
Photo storage and display application written in Rails.

[![Build Status](https://travis-ci.org/twuzz/twuzz.png)](https://travis-ci.org/twuzz/twuzz)
[![Code Climate](https://codeclimate.com/github/twuzz/twuzz.png)](https://codeclimate.com/github/twuzz/twuzz)

## Models
### User

* __id__
* __email__
* __password_digest__
* __first_name__
* __last_name__

### Photo
Photos represent metadata about the photograph.

* __id__
* __user_id__
* __created_at__

### Image
Images belong to Photos. Images are the actual visual data versions (JPG, etc.) of the photograph.

* __id__
* __photo_id__
* __original__ Boolean, `true` if this was the source image. Only one original is allowed per Photo. All images that are not original are transcoded from the original.
* __size__ data size in bytes
* __width__ image display width in pixels
* __height__ image display height in pixels
* __mime_type__ mime type of data ex: `image/jpeg`

### Datastore
  Datastores are the logical containers of ImageDatas.
  
  * __id__
  * __type__
  * __user_id__
  * __settings__

#### Datastore Types

* FilesystemDatastore
* AwsS3Datastore
* AwsGlacierDatastore

### ImageData
ImageDatas are the representations of the data in a Datastore.

* __id__
* __image_id__
* __datastore_id__

## License
The MIT License (MIT)
Copyright (c) 2013 John Rollin Wulff

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
