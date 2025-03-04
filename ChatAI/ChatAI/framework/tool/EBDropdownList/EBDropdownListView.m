//
//  EBDropdownList.m
//  DropdownListDemo
//
//  Created by HoYo on 2018/4/17.
//  Copyright © 2018年 HoYo. All rights reserved.
//

#import "EBDropdownListView.h"
@implementation EBDropdownListItem
- (instancetype)initWithItem:(NSString*)itemId itemName:(NSString*)itemName {
    self = [super init];
    if (self) {
        _itemId = itemId;
        _itemName = itemName;
    }
    return self;
}

- (instancetype)init {
    return [self initWithItem:nil itemName:nil];
}
@end


@interface EBDropdownListView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UITableView *tbView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, copy) EBDropdownListViewSelectedBlock selectedBlock;
@end

static CGFloat const kArrowImgHeight= 10;
static CGFloat const kArrowImgWidth= 15;
static CGFloat const kTextLabelX = 5;
static CGFloat const kItemCellHeight = 40;

@implementation EBDropdownListView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [self setupProperty];
    }
    return self;
}

- (instancetype)initWithDataSource:(NSArray*)dataSource {
    _dataSource = dataSource;
    return [self initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupFrame];
}

#pragma mark - Setup
- (void)setupProperty {
    _textColor = [UIColor blackColor];
    _font = [UIFont systemFontOfSize:14];
    _selectedIndex = 0;
    _textLabel.font = _font;
    _textLabel.textColor = _textColor;
    
    UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewExpand:)];
    [_textLabel addGestureRecognizer:tapLabel];

    UITapGestureRecognizer *tapImg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewExpand:)];
    [self addGestureRecognizer:tapImg];
}

- (void)setupView {
//    [self addSubview:self.textLabel];
    [self addSubview:self.arrowImg];
}

- (void)setupFrame {
    CGFloat viewWidth = CGRectGetWidth(self.bounds)
    , viewHeight = CGRectGetHeight(self.bounds);
  
    _textLabel.frame = CGRectMake(kTextLabelX, 0, viewWidth - kTextLabelX - kArrowImgWidth , viewHeight);
//    _arrowImg.frame = CGRectMake(CGRectGetWidth(_textLabel.frame), viewHeight / 2 - kArrowImgHeight / 2, kArrowImgWidth, kArrowImgHeight);
    _arrowImg.frame = CGRectMake(10, viewHeight / 2 - 25 / 2, 30, 25);
}

#pragma mark - Events
-(void)tapViewExpand:(UITapGestureRecognizer *)sender {
    [self rotateArrowImage];
    
    CGFloat tableHeight = _dataSource.count * kItemCellHeight;
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    [window addSubview:self.tbView];
   
    // 获取按钮在屏幕中的位置
    CGRect frame = [self convertRect:self.bounds toView:window];
    CGFloat tableViewY = frame.origin.y + frame.size.height;
    CGRect tableViewFrame;
    tableViewFrame.size.width = frame.size.width;
    tableViewFrame.size.height = tableHeight;
    tableViewFrame.origin.x = frame.origin.x;
    if (tableViewY + tableHeight < CGRectGetHeight([UIScreen mainScreen].bounds)) {
        tableViewFrame.origin.y = tableViewY;
    }else {
        tableViewFrame.origin.y = frame.origin.y - tableHeight;
    }
//    _tbView.frame = tableViewFrame;
    CGRect frame2 = tableViewFrame;
//    frame.size.width;
//    frame.size.height;
//    frame.origin.y;
//    frame.origin.x;
    if (self.director == RIGHT) {
        _tbView.frame = CGRectMake( window.frame.size.width - 160 , frame2.origin.y, 150, frame2.size.height);
    }else{
        _tbView.frame = CGRectMake(frame2.origin.x, frame2.origin.y, 150, frame2.size.height);

    }
    UITapGestureRecognizer *tagBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewDismiss:)];
    [_backgroundView addGestureRecognizer:tagBackground];
}

-(void)tapViewDismiss:(UITapGestureRecognizer *)sender {
    [self removeBackgroundView];
}

#pragma mark - Methods
- (void)setDropdownListViewSelectedBlock:(EBDropdownListViewSelectedBlock)block {
    _selectedBlock = block;
}

- (void)setViewBorder:(CGFloat)width borderColor:(UIColor*)borderColor cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}

- (void)rotateArrowImage {
    // 旋转箭头图片
    _arrowImg.transform = CGAffineTransformRotate(_arrowImg.transform, M_PI);
}

- (void)removeBackgroundView {
    [_backgroundView removeFromSuperview];
    [_tbView removeFromSuperview];
    [self rotateArrowImage];
}

- (void)selectedItemAtIndex:(NSInteger)index {
    _selectedIndex = index;
    if (index < _dataSource.count) {
        EBDropdownListItem *item = _dataSource[index];
        _selectedItem = item;
        _textLabel.text = item.itemName;
    }
}
#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = _font;
    cell.textLabel.textColor = _textColor;
    EBDropdownListItem *item = _dataSource[indexPath.row];
    cell.textLabel.text = item.itemName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self selectedItemAtIndex:indexPath.row];
    [self removeBackgroundView];
    if (_selectedBlock) {
        _selectedBlock(self);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}


#pragma mark - Setter

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count > 0) {
        [self selectedItemAtIndex:_selectedIndex];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [self selectedItemAtIndex:selectedIndex];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _textLabel.font = font;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _textLabel.textColor = textColor;
}
#pragma mark - Getter
- (UILabel*)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.userInteractionEnabled = YES;
    }
    return _textLabel;
}

- (UIImageView*)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.image = [UIImage imageNamed:@"more"];
        _arrowImg.userInteractionEnabled = YES;
    }
    return _arrowImg;
}

- (UITableView*)tbView {
    if (!_tbView) {
        _tbView = [UITableView new];
        _tbView.dataSource = self;
        _tbView.delegate = self;
        _tbView.tableFooterView = [UIView new];
        _tbView.backgroundColor = [UIColor whiteColor];
        _tbView.layer.shadowOffset = CGSizeMake(4, 4);
        _tbView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _tbView.layer.shadowOpacity = 0.8;
        _tbView.layer.shadowRadius = 4;
        _tbView.layer.borderColor = [UIColor grayColor].CGColor;
        _tbView.layer.borderWidth = 0.5;
        _tbView.clipsToBounds = NO;
        _tbView.rowHeight = kItemCellHeight;
    }
    return _tbView;
}

- (UIView*)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _backgroundView;
}

-(void)setUpImage:(NSString *)imageName{
    self.arrowImg.image = [UIImage imageNamed:imageName];
}

-(void)setupTableView:(CGRect)rect{
    CGFloat tableHeight = _dataSource.count * kItemCellHeight;
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    CGRect frame = [self convertRect:self.bounds toView:window];
    CGFloat tableViewY = frame.origin.y + frame.size.height;
    CGRect tableViewFrame;
    tableViewFrame.size.width = frame.size.width;
    tableViewFrame.size.height = tableHeight;
    tableViewFrame.origin.x = frame.origin.x;
    if (tableViewY + tableHeight < CGRectGetHeight([UIScreen mainScreen].bounds)) {
        tableViewFrame.origin.y = tableViewY;
    }else {
        tableViewFrame.origin.y = frame.origin.y - tableHeight;
    }
//    _tbView.frame = tableViewFrame;
    CGRect frame2 = tableViewFrame;
//    _tbView.frame = CGRectMake(frame2.origin.x, frame2.origin.y, 150, frame2.size.height);
    
    self.tbView.frame = rect;
}
@end
