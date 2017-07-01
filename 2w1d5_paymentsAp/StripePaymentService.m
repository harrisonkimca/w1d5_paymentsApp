//
//  StripePaymentService.m
//  2w1d5_paymentsAp
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

- (void)processPaymentAmount:(NSInteger)amount
{
    NSLog(@"Stripe processed amount $%lu", amount);
}

- (BOOL)canProcessPayment
{
    if(arc4random_uniform(2) == 0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}



@end
