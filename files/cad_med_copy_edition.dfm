inherited CadMedCopyEdition: TCadMedCopyEdition
  Caption = 'Tiragem'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    ExplicitTop = -1
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 718
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object ctn_StateCity: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alLeft
        TabOrder = 1
      end
      object E_Tiragem: TUniEdit
        AlignWithMargins = True
        Left = 484
        Top = 3
        Width = 121
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Tiragem'
        FieldLabelAlign = laTop
        ExplicitLeft = 512
        ExplicitTop = -304
        ExplicitHeight = 22
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 718
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitTop = 122
      ExplicitWidth = 794
      object Sb_Ins_Produto: TUniBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 135
        Height = 46
        Hint = ''
        Caption = 'Inserir'
        Align = alLeft
        TabOrder = 1
      end
      object Sb_Exc_Produto: TUniBitBtn
        AlignWithMargins = True
        Left = 144
        Top = 3
        Width = 130
        Height = 46
        Hint = ''
        Caption = 'Excluir'
        Align = alLeft
        TabOrder = 2
      end
    end
    object DBG_Produtos: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 109
      Width = 712
      Height = 207
      Hint = ''
      WebOptions.Paged = False
      WebOptions.CustomizableCells = False
      LoadMask.Message = 'Carregando dados...'
      Align = alClient
      Font.Color = clBlack
      ParentFont = False
      TabOrder = 3
      Columns = <
        item
          FieldName = 'tb_product_id'
          Title.Caption = 'C'#243'digo do Produto'
          Width = 112
          Font.Color = clNavy
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 541
          Font.Color = clNavy
        end>
    end
  end
end
