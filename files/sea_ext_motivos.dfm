inherited SeaExtMotivos: TSeaExtMotivos
  ClientWidth = 520
  Caption = 'Pesquisa de Motivos Reprova'#231#227'o/Condena'#231#227'o'
  ExplicitWidth = 536
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 73
    Width = 520
    Height = 399
    ExplicitTop = 73
    ExplicitWidth = 520
    ExplicitHeight = 399
    inherited dbg_Search: TUniDBGrid
      Width = 516
      Height = 395
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'kind'
          Title.Caption = 'Tipo'
          Width = 108
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 604
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 520
    Height = 73
    ExplicitWidth = 520
    ExplicitHeight = 73
    object UniGroupBox1: TUniGroupBox
      Left = 3
      Top = 2
      Width = 511
      Height = 63
      Hint = ''
      Caption = 'Digite sua op'#231#227'o de busca'
      TabOrder = 1
      object UniLabel1: TUniLabel
        Left = 5
        Top = 18
        Width = 20
        Height = 13
        Hint = ''
        Caption = 'Tipo'
        TabOrder = 1
      end
      object Cb_Kind: TUniComboBox
        Left = 5
        Top = 34
        Width = 112
        Hint = ''
        Text = 'Cb_Kind'
        Items.Strings = (
          'CONDENA'#199#195'O'
          'REPROVA'#199#195'O')
        ItemIndex = 0
        TabOrder = 2
      end
      object E_Description: TUniEdit
        Left = 123
        Top = 34
        Width = 383
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 123
        Top = 18
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Descri'#231#227'o'
        TabOrder = 4
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 520
    ExplicitWidth = 520
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchkind: TStringField
      FieldName = 'kind'
      Size = 25
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
end
