//
//  PaymentGateway.m
//  2w1d5_paymentsAp
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount:(NSInteger)amount
{
    //[self.paymentDelegate processPaymentAmount:amount];
    
    if ([self.paymentDelegate canProcessPayment])
    {
        [self.paymentDelegate processPaymentAmount:amount];
    }
    else
    {
        NSLog(@"Sorry unable to process your request");
    }
}


@end
