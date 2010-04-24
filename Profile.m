/*
 * Copyright (c) 2007-2010 Savory Software, LLC, http://pg.savorydeviate.com/
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * $Id: Profile.m 315 2010-04-17 04:12:45Z Tanaris4 $
 *
 */

#import "Profile.h"
#import "SaveDataObject.h"

@implementation Profile

- (id) init
{
    self = [super init];
    if (self != nil) {
		_name = @"";
    }
    return self;
}

- (id)initWithName: (NSString*)name {
    self = [self init];
    
    _name = [[name copy] retain];
	
    return self;
}

+ (id)profileWithName: (NSString*)name {
    return [[[Profile alloc] initWithName: name] autorelease];
}

- (id)initWithCoder:(NSCoder *)decoder{
	if ( !self ){
		self = [self init];
	}
	
	if ( self ) {
		[super initWithCoder:decoder];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
	[super encodeWithCoder:coder];
}

- (id)copyWithZone:(NSZone *)zone{
    Profile *copy = [[[self class] allocWithZone: zone] initWithName: self.name];
    return copy;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
	self.changed = YES;
}

@end