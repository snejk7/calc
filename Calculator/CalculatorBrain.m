//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Marcin on 14.04.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if(_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(self.operandStack) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];}
    
    else if([operation isEqualToString:@"-"]){
        result = [self popOperand] - [self popOperand];}
    
    else if([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];}
    
    else if([operation isEqualToString:@"/"]){
        result = [self popOperand] / [self popOperand];}
    
    [self pushOperand:result];

    return result;
}

@end
