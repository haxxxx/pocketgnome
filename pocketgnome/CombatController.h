//
//  CombatController.h
//  Pocket Gnome
//
//  Created by Jon Drummond on 12/18/07.
//  Copyright 2007 Savory Software, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Unit;
@class Controller;
@class ChatController;
@class MobController;
@class BotController;
@class MovementController;
@class PlayerDataController;

@interface CombatController : NSObject {
    IBOutlet Controller *controller;
    IBOutlet PlayerDataController *playerData;
    IBOutlet BotController *botController;
    IBOutlet MobController *mobController;
    IBOutlet ChatController *chatController;
    IBOutlet MovementController *movementController;

    BOOL _inCombat;
    BOOL _combatEnabled;
    BOOL _technicallyOOC;
    BOOL _attemptingCombat;
    Unit *_attackUnit;
    NSMutableArray *_combatUnits;
    NSMutableArray *_attackQueue;
    NSMutableArray *_blacklist;
    NSMutableDictionary *_initialDistances;
}

@property BOOL combatEnabled;
@property (readonly, retain) Unit *attackUnit;

// combat status
- (BOOL)inCombat;

// sent from PlayerDataController
- (void)playerEnteringCombat;
- (void)playerLeavingCombat;

// Send from Mob Controller (later PlayersController)
- (void)setInCombatUnits: (NSArray*)units;

// combat state
- (NSArray*)combatUnits;
- (NSArray*)attackQueue;

// mob status
- (BOOL)isUnitBlacklisted: (Unit*)unit;

// action initiation
- (void)disposeOfUnit: (Unit*)unit;
- (void)cancelAllCombat;



////// INPUTS //////
// --> playerEnteringCombat
// --> playerLeavingCombat
// --> setInCombatUnits
////// OUTPUT /////
// <-- playerEnteringCombat
// <-- playerLeavingCombat
// <-- addingUnit
// <-- attackUnit
// <-- finishUnit
///////////////////


@end