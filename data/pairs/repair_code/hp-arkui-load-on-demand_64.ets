import { MyDataSource } from './MyDataSource';

@Reusable
@Component
struct ItemComponent {
  @State introduce: string = ''

  aboutToReuse(params: Record<string, ESObject>) {
    this.introduce = params.introduce
  }

  build() {
    Text(this.introduce)
      .fontSize(14)
      .padding({ left: 5, right: 5 })
      .margin({ top: 5 })
  }
}

@Entry
@Component
struct MyComponent {
  private data: MyDataSource = new MyDataSource()

  build() {
    List() {
      LazyForEach(this.data, (item: string) => {
        ListItem() {
          ItemComponent({ introduce: item }).reuseId(item)
        }
      }, (item: string) => item)
    }
    .width('100%')
    .height('100%')
    .cachedCount(2)
  }
}
