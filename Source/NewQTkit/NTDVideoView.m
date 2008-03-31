//
//  TDVideoView.m
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

#import "TDVideoView.h"
#import "TDCaptureSession.h"
#import "TDQTKit.h"

@interface TDVideoView(PrivateMethods)
- (void)reinit;
@end
@implementation TDVideoView

- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self reinit];
  }
  return self;
}

- (void)awakeFromNib {
  [self reinit];
}

- (void)dealloc {
  [mI release];
  [super dealloc];
}

- (void)setCaptureSession:(TDCaptureSession *)captureSession {
  [mI setCaptureSession:[captureSession impl]];
}

- (BOOL)validateMenuItem:(NSMenuItem *)anItem {
  return NO;
}

@end
@implementation TDVideoView(PrivateMethods)
- (void)reinit {
  [mI release];
  mI = [[QTCaptureView alloc] initWithFrame:[self bounds]];
  [self addSubview:mI];
}
@end

