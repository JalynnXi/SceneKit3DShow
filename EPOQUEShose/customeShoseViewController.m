//
//  customeShoseViewController.m
//  EPOQUEShose
//
//  Created by EPOQUE on 07/04/2017.
//  Copyright © 2017 JalynnXi. All rights reserved.
//

#import "customeShoseViewController.h"
#import <SceneKit/SceneKit.h>
@interface customeShoseViewController ()
@property(strong,nonatomic)SCNView *scnView;
@property(nonatomic,strong)SCNNode *shoseNode;
@property(nonatomic,strong)UIView *shoseView;
@property(nonatomic,strong)UILabel *titleLabel;


@end

@implementation customeShoseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"模型定制";
    self.view.backgroundColor = XMGColor(255, 236, 200);
    [self layoutView];
    [self changeshosesurface];
    [self addSCNView];
    
}

-(void)layoutView{
    
    self.shoseView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 0.6*kScreenHeight)];
    [self.view addSubview:_shoseView];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _shoseView.frame.size.height+64, kScreenWidth, 40)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = XMGColor(255, 210, 125);
    _titleLabel.text = @"板鞋👟";
    [self.view addSubview:_titleLabel];
    
    
}

-(void)addSCNView{
    SCNSceneSource *sceneSource = [SCNSceneSource sceneSourceWithURL:[[NSBundle mainBundle] URLForResource:@"vans-authentic-shoe-low-poly" withExtension:@".dae"] options:nil];
    
    //     SCNNode *shoseNode = [sceneSource entryWithIdentifier:@"vans-authentic-shoe-low-poly" withClass:[SCNNode class]];
    
    _scnView= [[SCNView alloc]initWithFrame:self.shoseView.bounds];
    _scnView.allowsCameraControl = YES;
    _scnView.showsStatistics = YES;
    _scnView.backgroundColor = XMGColor(255, 236, 190);
    
    
    
    SCNScene *scene  = [sceneSource sceneWithOptions:nil error:nil];
    
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.camera.automaticallyAdjustsZRange = true;
    cameraNode.camera.zFar = 400;//视距
    [scene.rootNode addChildNode:cameraNode];
    cameraNode.position = SCNVector3Make(0, 0, 300);
    //    cameraNode.eulerAngles = SCNVector3Make(0,M_PI/4, 0);
    // create and add a light to the scene
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 0, 100);
    [scene.rootNode addChildNode:lightNode];
    
    // create and add an ambient light to the scene
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor whiteColor];
    [scene.rootNode addChildNode:ambientLightNode];
    
    _shoseNode = [_scnView.scene.rootNode childNodeWithName:@"Authentic-Low-Poly" recursively:YES];
    _scnView.scene = scene;
    // retrieve the SCNView
        [self.shoseView addSubview:_scnView];
}


-(void)changeshosesurface{
    UIButton *redbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    redbutton.frame = CGRectMake(20, _titleLabel.frame.origin.y +60, 120, 50);
    [redbutton setTitle:@"鞋面颜色" forState:UIControlStateNormal];
    [redbutton addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    redbutton.backgroundColor  = XMGColor(255, 210, 125);
    [self.view addSubview:redbutton];
    
  
    
    UIButton *xjxbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    xjxbutton.frame = CGRectMake(kScreenWidth-120-20, _titleLabel.frame.origin.y +60, 120, 50);
    [xjxbutton setTitle:@"鞋带" forState:UIControlStateNormal];
    [xjxbutton addTarget:self action:@selector(heartClothes) forControlEvents:UIControlEventTouchUpInside];
    xjxbutton.backgroundColor  = XMGColor(255, 210, 125);
    [self.view addSubview:xjxbutton];
}

-(void)changeColor{
    
    SCNNode *shirtNode = [_scnView.scene.rootNode childNodeWithName:@"polySurface394" recursively:YES];
    shirtNode.geometry.firstMaterial.diffuse.contents  = RandomColor;
//    SCNNode *newnode = [shirtNode clone];
////    [_shoseNode replaceChildNode:shirtNode with:newnode];
//    [shirtNode removeFromParentNode];
//    SCNNode *sunNode = [SCNNode node];
//    sunNode.geometry = [SCNSphere sphereWithRadius:100];
//    sunNode.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
    
    NSLog(@"%@ ❤️❤️❤️",shirtNode);
//    NSLog(@"%@ ❤️❤️❤️",newnode);
//    [_shoseNode replaceChildNode:shirtNode with:sunNode];
//    [_shoseNode addChildNode:sunNode];
    
}

-(void)heartClothes{
    SCNNode *shirtNode = [_scnView.scene.rootNode childNodeWithName:@"Binding" recursively:YES];
    shirtNode.geometry.firstMaterial.diffuse.contents = RandomColor;
//    SCNAction *sunaction = [SCNAction repeatAction:[SCNAction rotateByAngle:<#(CGFloat)#> aroundAxis:<#(SCNVector3)#> duration:<#(NSTimeInterval)#>] count:<#(NSUInteger)#>]
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
