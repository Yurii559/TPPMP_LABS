#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *fibArray = [NSArray arrayWithObjects:
        [NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
        [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:5],
        [NSNumber numberWithInt:8], [NSNumber numberWithInt:13], [NSNumber numberWithInt:21],
        [NSNumber numberWithInt:34], nil];
    NSLog(@"1. Масив fibArray: %@", fibArray);
    
    NSArray *revArray = [[fibArray reverseObjectEnumerator] allObjects];
    NSLog(@"2. Обернений масив revArray: %@", revArray);
    
    NSArray *snglArray = [NSArray arrayWithObjects:
        [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:5],
        [NSNumber numberWithInt:7], [NSNumber numberWithInt:11], [NSNumber numberWithInt:13],
        [NSNumber numberWithInt:17], [NSNumber numberWithInt:19], [NSNumber numberWithInt:23],
        [NSNumber numberWithInt:29], [NSNumber numberWithInt:31], [NSNumber numberWithInt:37],
        [NSNumber numberWithInt:41], [NSNumber numberWithInt:43], [NSNumber numberWithInt:47],
        [NSNumber numberWithInt:53], [NSNumber numberWithInt:59], [NSNumber numberWithInt:61],
        [NSNumber numberWithInt:67], [NSNumber numberWithInt:71], [NSNumber numberWithInt:73],
        [NSNumber numberWithInt:79], [NSNumber numberWithInt:83], [NSNumber numberWithInt:89],
        [NSNumber numberWithInt:97], nil];
    NSLog(@"3. Прості числа snglArray: %@", snglArray);
    NSLog(@"4. Кількість елементів snglArray: %lu", (unsigned long)[snglArray count]);
    NSLog(@"5. 10-й елемент snglArray: %@", [snglArray objectAtIndex:9]);
    NSLog(@"6. Підмасив з 15-го по 20-й елементи: %@", [snglArray subarrayWithRange:NSMakeRange(14, 6)]);
    
    NSMutableArray *rptArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        [rptArray addObject:[snglArray objectAtIndex:9]];
    }
    NSLog(@"7. Масив rptArray: %@", rptArray);
    
    NSMutableArray *oddArray = [NSMutableArray arrayWithObjects:
        [NSNumber numberWithInt:1], [NSNumber numberWithInt:3], [NSNumber numberWithInt:5],
        [NSNumber numberWithInt:7], [NSNumber numberWithInt:9], nil];
    NSLog(@"8. Непарні числа oddArray: %@", oddArray);
    
    [oddArray addObject:[NSNumber numberWithInt:11]];
    NSLog(@"9. Додано число 11: %@", oddArray);
    
    NSArray *subOdd = [NSArray arrayWithObjects:
        [NSNumber numberWithInt:15], [NSNumber numberWithInt:17], [NSNumber numberWithInt:19], nil];
    [oddArray addObjectsFromArray:subOdd];
    NSLog(@"10. Додано підмасив [15, 17, 19]: %@", oddArray);
    
    NSUInteger idx15 = [oddArray indexOfObject:[NSNumber numberWithInt:15]];
    if (idx15 != NSNotFound) {
        [oddArray insertObject:[NSNumber numberWithInt:13] atIndex:idx15];
    }
    NSLog(@"11. Вставлено 13 між 11 та 15: %@", oddArray);
    
    [oddArray removeObjectsInRange:NSMakeRange(4, 3)];
    NSLog(@"12. Видалено елементи з 5-го по 8-й (невключно): %@", oddArray);
    
    id lastElement = [[[oddArray lastObject] retain] autorelease];
    [oddArray removeLastObject];
    NSLog(@"13. Видалений останній елемент: %@, масив: %@", lastElement, oddArray);
    
    NSArray *replacement = [NSArray arrayWithObjects:
        [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil];
    [oddArray replaceObjectsInRange:NSMakeRange(1, [oddArray count] - 1) withObjectsFromArray:replacement];
    NSLog(@"14. Замінено з 2-го до останнього на [2, 3, 4]: %@", oddArray);
    
    [oddArray removeObject:[NSNumber numberWithInt:3]];
    NSLog(@"15. Видалено елемент 3: %@", oddArray);
    NSLog(@"16. Чи міститься число 3 у oddArray?: %@", [oddArray containsObject:[NSNumber numberWithInt:3]] ? @"true" : @"false");
    NSLog(@"17. Рядкове представлення oddArray: %@", [oddArray description]);
    
    [pool drain];
    return 0;
}
