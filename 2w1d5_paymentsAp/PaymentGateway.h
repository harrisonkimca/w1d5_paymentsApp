//
//  PaymentGateway.h
//  2w1d5_paymentsAp
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentDelegate <NSObject>

- (void)processPaymentAmount:(NSInteger)amount;
- (BOOL)canProcessPayment;

@end

@interface PaymentGateway : NSObject

@property(weak, nonatomic) id <PaymentDelegate> paymentDelegate;

- (void)processPaymentAmount:(NSInteger)amount;

@end
