//
//  TJBorderedButton.h
//  TJFoundation
//
//  Created by Thomas Joulin on 2/17/14.
//
//

@interface TJBorderedButton : UIButton

@property (nonatomic, assign) CGFloat borderThickness UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat topBorderThickness UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat bottomBorderThickness UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat leftBorderThickness UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat rightBorderThickness UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *borderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *leftBorderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *rightBorderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *topBorderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *bottomBorderColor UI_APPEARANCE_SELECTOR;

@end
