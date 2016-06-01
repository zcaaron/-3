//
//  ViewController.m
//  城市选择3
//
//  Created by 张城 on 16/5/12.
//  Copyright © 2016年 张城. All rights reserved.
//

#import "ViewController.h"
#import "ProvincesModel.h"
@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSArray * dataArray;

@property (nonatomic,strong) NSArray * temArr;


@end

@implementation ViewController
-(NSArray*)dataArray{
    if (nil == _dataArray) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil];
        NSArray * temp = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * muss = [NSMutableArray array];
        for (NSDictionary * dic in temp) {
            ProvincesModel * model = [ProvincesModel modelWithDic:dic];
            
            [muss addObject:model];
        }
        _dataArray = muss;
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerView.dataSource = self;
    
    _pickerView.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    ProvincesModel * model = self.dataArray[_index];
    if (component == 0) {
        return self.dataArray.count;
    }else{
//        return model.cities.count;
        
        NSInteger num = [pickerView selectedRowInComponent:0];
        
        ProvincesModel * model = self.dataArray[num];
        
        
        self.temArr = model.cities;
        
        return _temArr.count;
    }
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    if (component == 0) {
         ProvincesModel * model = self.dataArray[row];
        return model.name;
        
        
    }else{
//        ProvincesModel * model = self.dataArray[_index];
//        
//        NSInteger num = [pickerView selectedRowInComponent:0];
//        
//        ProvincesModel * model = self.dataArray[num];
//        
//        NSArray * citiesArr = model.cities;
//        
//        
//        return citiesArr[row];
        
        return self.temArr[row];
    }
    

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        
//        _index = row;
        
        [_pickerView reloadComponent:1];
        [_pickerView selectRow:0 inComponent:1 animated:YES];
    }
}
@end
