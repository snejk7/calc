//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Marcin on 14.04.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain

@synthesize programStack = _programStack;

- (NSMutableArray *)programStack
{
    if(_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (void)pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

- (id)program
{
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"This is my description";
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStact = [stack lastObject];
    if(topOfStact) [stack removeLastObject];
    
    if([topOfStact isKindOfClass:[NSNumber class]]) {
        result = [topOfStact doubleValue]; 
    }
    else if([topOfStact isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStact;
        
        if([operation isEqualToString:@"+"]){
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];}
        else if([operation isEqualToString:@"*"]){
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];}
        else if([operation isEqualToString:@"-"]){
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;}
        else if([operation isEqualToString:@"/"]){
            double divisor = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] / divisor;}
    }
    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}
    
@end
