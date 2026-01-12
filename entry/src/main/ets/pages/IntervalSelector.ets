@Builder
export function IntervalSelectorBuilder(
  selected: number,
  onSelect: (value: number) => void
) {
  IntervalSelector({
    selected: selected,
    onSelect: onSelect
  })
}

@Component
export default struct IntervalSelector {
  @Prop selected: number
  @Prop onSelect: (value: number) => void

  private intervals: number[] = [5, 10, 15, 20, 30, 45, 60]

  build() {
    NavDestination() {
      Row() {
        ForEach(
          this.intervals,
          (item: number) => {
            Button(`${item}`)
              .width(40)
              .height(40)
              .margin({ right: 10 })
              .backgroundColor(
                this.selected === item ? '#4CAF50' : '#333333'
              )
              .fontColor(Color.White)
              .borderRadius(8)
              .onClick(() => {
                this.onSelect(item)
              })
          },
          (item: number) => item.toString()
        )
      }
      .justifyContent(FlexAlign.Center)
      .margin({ top: 10 })
    }
  }
}