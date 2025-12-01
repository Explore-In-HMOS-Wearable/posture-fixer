@Builder
export function IntervalSelectorBuilder() {
  IntervalSelector()
}

@Component
export default struct IntervalSelector {
  @Prop selected: number;
  @Prop onSelect: (value: number) => void;

  private intervals: number[] = [5, 10, 15, 20, 30, 45, 60];
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination(){
    Row() {
      ForEach(this.intervals, (item: number) => {
        Button(`${item}`)
          .width(40)
          .height(40)
          .margin({ right: 10 })
          .backgroundColor(this.selected === item ? '#4CAF50' : '#333')
          .onClick(() => this.onSelect(item));
      })
    }
    .justifyContent(FlexAlign.Center)
    .margin({ top: 10 })
  }
  }
}