# MotionLab

一个基于 Objective-C 的 iOS 动画效果仓库，原始项目包含大量演示型动画。当前版本将重点放在更适合业务项目复用的几个组件上，同时保留其余示例，并统一放到“不推荐但可参考”的分类里。

## 推荐优先使用的动画

### 1. `MLRippleView`

适合雷达波纹、定位提示、按钮强调、录音入口反馈等场景。

```objc
MLRippleView *rippleView = [[MLRippleView alloc] initWithFrame:CGRectMake(0, 0, 220, 220)];
[self.view addSubview:rippleView];
[rippleView showWithRippleType:MLRippleTypeRing];
```

### 2. `MLCircleLoadAnimationView`

适合做图片加载、首屏展开、内容蒙版展开动画。

```objc
MLCircleLoadAnimationView *shapeView = [[MLCircleLoadAnimationView alloc] initWithFrame:self.view.bounds];
shapeView.loadingImage.image = [UIImage imageNamed:@"tree.jpg"];
[self.view addSubview:shapeView];
[shapeView startLoading];
```

### 3. `MLVoiceWaveView`

适合语音输入、录音、语音助手、麦克风状态反馈。

```objc
self.voiceWaveView = [[MLVoiceWaveView alloc] init];
[self.voiceWaveView showInParentView:self.voiceWaveParentView];
[self.voiceWaveView startVoiceWave];
```

### 4. `MLWaterWaveView`

适合进度、水位、电量、健康值等可视化展示。

```objc
MLWaterWaveView *waterWave = [[MLWaterWaveView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
waterWave.percent = 0.6;
waterWave.firstWaveColor = [UIColor colorWithRed:146/255.0 green:148/255.0 blue:216/255.0 alpha:1.0];
waterWave.secondWaveColor = [UIColor colorWithRed:84/255.0 green:87/255.0 blue:197/255.0 alpha:1.0];
[self.view addSubview:waterWave];
[waterWave startWave];
```

### 5. `UITableViewController+MLRefresh`

适合自定义下拉刷新和上拉加载的交互实验。

## 当前示例入口

示例首页现在分成两类：

- `推荐使用`
- `不推荐，仅供参考`

这样既能优先看到高复用动画，也不会丢掉其他示例。

工程路径：

- `MotionEffects/`
- `MotionLab/MotionLab.xcodeproj`

## 不推荐但保留的示例

以下内容仍然保留在仓库中，方便参考实现，但不再作为优先推荐组件：

- `参考实现`
  `commonWave`、`heartBeatPulse`、`microPhoneWave`、`fanshaped`、`carouselTitle`
- `老旧实现/兼容性一般`
  `seaWaterWave`、`LoadGif`
- `视觉实验`
  `replicator`、`emitter`

推荐理解方式：

- `参考实现`
  有一定实现参考价值，但交互和代码风格偏旧。
- `老旧实现/兼容性一般`
  与现代 iOS 项目兼容性一般，或实现方式已经不再是首选。
- `视觉实验`
  更偏展示效果和动效实验，不适合作为常规业务组件优先集成。

## 说明

- 这是一个老的 UIKit / Objective-C 项目，更适合按需拷贝组件，而不是整库直接集成。
- `seaWaterWave` 依赖 OpenGL 风格实现，不建议作为现代项目的首选方案。
- 如需进一步组件化，建议优先从 `ripple`、`circleLoad`、`voiceWave`、`waterWave` 开始拆分。
