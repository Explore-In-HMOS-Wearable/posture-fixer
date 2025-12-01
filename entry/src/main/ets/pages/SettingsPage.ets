import IntervalSelector from './IntervalSelector';
import settingsData from './settingsData';

@Builder
export function SettingsPageBuilder() {
  SettingsPage()
}

@Component
struct SettingsPage {
  @State selectedInterval: number = settingsData.interval;
  @Consume pathStack : NavPathStack;

  save() {
    settingsData.interval = this.selectedInterval;
    this.pathStack.pop();
  }

  build() {
    NavDestination() {
      Column() {
        Text('Reminder Settings')
          .fontSize(24)
          .margin({ top: 20 })

        Text('Interval (minutes)')
          .fontSize(16)
          .margin({ top: 20 })

        IntervalSelector({
          selected: this.selectedInterval,
          onSelect: (v: number) => this.selectedInterval = v
        })

        Button('Save')
          .margin({ top: 30 })
          .onClick(() => this.save())
      }
      .justifyContent(FlexAlign.Center)
      .height('100%')
    }
  }
}