//
//  TDCaptureMovieFileOutput.m
//  VideoRecorder
//
//  Created by David Phillip Oster on 2/14/08.
//  Copyright 2008 Google Inc. 
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License.  You may obtain a copy
// of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
// License for the specific language governing permissions and limitations under
// the License.

//

#import "TDCaptureMovieFileOutput.h"
#import "TDQTKit.h"

@implementation TDCaptureMovieFileOutput
- (id)init {
  self = [super init];
  if (self) {
    mI = [[QTCaptureMovieFileOutput alloc] init];
  }
  return self;
}


- (void)dealloc {
  [mI release];
  [super dealloc];
}

- (void)setDelegate:(id)delegate {
  [mI setDelegate:delegate];
}

- (void)recordToOutputFileURL:(NSURL *)url {
  [mI recordToOutputFileURL:url];
}

- (NSTimeInterval)recordedDuration {
  NSTimeInterval val = 0;
  if (mI) {
    QTGetTimeInterval([(QTCaptureMovieFileOutput *) mI recordedDuration], &val);
  }
  return val;
}

- (UInt64)recordedFileSize {
  return [mI recordedFileSize];
}

@end
@implementation TDCaptureMovieFileOutput(Protected) 
- (id)impl {
  return mI;
}

- (id)initWithImpl:(id) impl {
  self = [super init];
  if (self) {
    mI = [impl retain];
  }
  return self;
}
 
@end
