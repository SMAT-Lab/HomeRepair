// 源码文件，请以工程实际为准
import { MyDataSource } from './MyDataSource';

@Reusable
@Component
struct TextItem {
  @State item: string = "";

  build() {
    Text(this.item)
      .fontSize(16)
      .backgroundColor(0xF9CF93)
      .width('100%')
      .height(80)
      .textAlign(TextAlign.Center)
      .onClick(() => {
        this.item = 'click';
      })
  }
}

@Entry
@Component
struct MyComponent{
  private datasource: MyDataSource = new MyDataSource();
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 1; i <= 2000; i++) {
      this.datasource.pushData(i + '');
    }
  }

  build() {
    Column({ space: 5 }) {
      Text('Use columnStart and columnEnd to set the GridItem size').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller) {
        LazyForEach(this.datasource, (item: string, index: number) => {
          if ((index % 4) === 0) {
            GridItem() {
              TextItem({ item: item })
            }
            .columnStart(0).columnEnd(2)
          } else {
            GridItem() {
              TextItem({ item: item })
            }
          }
        }, (item: string) => item)
      }
      .cachedCount(1)
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('40%')

      Button("scrollToIndex:1900").onClick(() => {
        this.scroller.scrollToIndex(1900);
      })
    }.width('100%')
    .margin({ top: 5 })
  }
}