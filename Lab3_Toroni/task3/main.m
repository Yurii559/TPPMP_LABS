#import <Foundation/Foundation.h>

@interface MyNumber : NSObject {
    NSNumber *_value; 
}
@property (nonatomic, retain) NSNumber *value;
@end

@implementation MyNumber
@synthesize value = _value;

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"MyNumber init");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"MyNumber dealloc (value = %@)", _value);
    [_value release];
    [super dealloc];
}
@end

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *mainPool = [[NSAutoreleasePool alloc] init];
    
    NSLog(@"--- Спосіб 1: alloc / release ---");
    MyNumber *num1 = [[MyNumber alloc] init];
    num1.value = [NSNumber numberWithInt:100];
    NSLog(@"num1.value = %@", num1.value);
    
    [num1 release]; 
    num1 = nil;

    NSLog(@"--- Спосіб 2: NSAutoreleasePool / autorelease ---");
    NSAutoreleasePool *innerPool = [[NSAutoreleasePool alloc] init];
    
    MyNumber *num2 = [[[MyNumber alloc] init] autorelease];
    num2.value = [NSNumber numberWithInt:250];
    NSLog(@"num2.value = %@", num2.value);
    
    [innerPool release]; 

    [mainPool release];
    return 0;
}