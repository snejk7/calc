//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Marcin on 14.04.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)popOperand;
- (double)performOperation:(NSString *)operation;

@end
