//
//  AASUser.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/29/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AASRootTeam.h"

@interface AASUser : NSObject

@property (nonatomic) NSString * name;
@property (nonatomic) NSString * email;
@property (nonatomic) NSInteger sexo;
@property (nonatomic) UIImage * photo;

@property (nonatomic) AASRootTeam * team;

@end
