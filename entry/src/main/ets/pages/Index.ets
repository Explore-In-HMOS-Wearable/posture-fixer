import settingsData from './settingsData';
import { vibrator } from '@kit.SensorServiceKit';

@Entry
@Component
struct HomePage {
  @State isRunning: boolean = false;
  @State remaining: number = 0;
  @State showImage: boolean = false;
  private timerId: number = 0;
  pathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    this.remaining = settingsData.interval * 60; // saniye
  }

  startTimer() {
    if (this.isRunning) return;
    this.isRunning = true;

    this.timerId = setInterval(() => {
      if (this.remaining > 0) {
        this.remaining--;
      } else {
        this.triggerReminder();
      }
    }, 1000);
  }

  stopTimer() {
    this.isRunning = false;
    clearInterval(this.timerId);
  }

  triggerReminder() {
    console.info('Vibration triggered');
    //vibration API here

    this.remaining = settingsData.interval * 60;
  }

  build() {
Navigation(this.pathStack){
    Column() {
      Text('Posture Fixer')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .fontColor(Color.Black)


    if (this.showImage){
      Image($r('app.media.posture_fix_image'))
        .objectFit(ImageFit.Contain)
        .width('%80')
        .height('%80')
    }


      Text(`Next reminder in: ${Math.floor(this.remaining / 60)}m ${this.remaining % 60}s`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8 })
        .fontColor(Color.Black)

      Row() {
        Button(this.isRunning ? 'Stop' : 'Start')
          .backgroundColor(Color.Black)
          .width('30%')
          .height(30)
          .margin({ top: 15 })
          .onClick(() => {
              this.isRunning ? this.stopTimer() : this.startTimer();
          })
      }
      .justifyContent(FlexAlign.Center)

      Button('Settings')
        .backgroundColor(Color.Black)
        .margin({ top: 8 })
        .width('40%')
        .height(30)
        .onClick(() => {
          this.pathStack.pushPath({name: 'pages/SettingsPage'});
        })

    }

    .justifyContent(FlexAlign.Center)
    .height('100%')
  }
  .backgroundColor('#651AB8')
  .hideTitleBar(true)
    .hideBackButton(true)
    .hideToolBar(true)
    .mode(NavigationMode.Stack)
  }
}