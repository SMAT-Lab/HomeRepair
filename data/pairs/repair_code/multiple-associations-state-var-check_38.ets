@Observed
class UIStyle {
  fontSize: number = 0;
  fontColor: string = '';
  isChecked: boolean = false;
}
@Entry
@Component
struct MultipleAssociationsStateVarNoReport0 {
  @State uiStyle: UIStyle = new UIStyle();
  private listData: string[] = [];
  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.listData.push(`ListItemComponent ${i}`);
    }
  }
  build() {
    Row() {
      Column() {
        CompA({item: '1', index: 1, subStyle: this.uiStyle})
        CompB({item: '2', index: 2, subStyle: this.uiStyle})
        CompC({item: '3', index: 3, subStyle: this.uiStyle})
        Text('change state var')
          .onClick(()=>{
            this.uiStyle.fontSize = 20;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
@Component
struct CompA {
  @Prop item: string;
  @Prop index: number;
  @Link @Watch('onStyleChange') subStyle: UIStyle;
  @State fontSize: number = 0;
  isRender(): number {
    console.info(`CompA ${this.index} Text is rendered`);
    return this.fontSize;
  }
  onStyleChange() {
    this.fontSize = this.subStyle.fontSize;
  }
  build() {
    Column() {
      Text(this.item)
        .fontSize(this.isRender())
        .fontSize(this.fontSize)
      Text('abc')
    }
  }
}
@Component
struct CompB {
  @Prop item: string;
  @Prop index: number;
  @Link @Watch('onStyleChange') subStyle: UIStyle;
  @State fontColor: string = '#00ffff';
  isRender(): number {
    console.info(`CompB ${this.index} Text is rendered`);
    return 10;
  }
  onStyleChange() {
    this.fontColor = this.subStyle.fontColor;
  }
  build() {
    Column() {
      Text(this.item)
        .fontSize(this.isRender())
        .fontColor(this.fontColor)
      Text('abc')
    }
  }
}
@Component
struct CompC {
  @Prop item: string;
  @Prop index: number;
  @Link @Watch('onStyleChange') subStyle: UIStyle;
  @State isChecked: boolean = false;
  isRender(): number {
    console.info(`CompC ${this.index} Text is rendered`);
    return 50;
  }
  onStyleChange() {
    this.isChecked = this.subStyle.isChecked;
  }
  build() {
    Column() {
      if (this.isChecked) {
        Text('checked')
      } else {
        Text('unchecked')
      }
    }
  }
}