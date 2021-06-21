inherited CadVehBrandModel: TCadVehBrandModel
  ClientWidth = 574
  Caption = 'Cadastro de Marca e Modelo'
  ExplicitWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Width = 574
    ExplicitWidth = 574
  end
  inherited pnl_fundo: TUniPanel
    Width = 574
    ExplicitWidth = 574
    object UniPanel1: TUniPanel
      Left = 2
      Top = 279
      Width = 570
      Height = 40
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = 'UniPanel1'
      DesignSize = (
        570
        40)
      object sb_Insert_Items: TUniSpeedButton
        Left = 4
        Top = 4
        Width = 127
        Height = 31
        Hint = ''
        Caption = 'Novo Item'
        Anchors = [akLeft, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = sb_Insert_ItemsClick
      end
      object sb_Change_Items: TUniSpeedButton
        Left = 131
        Top = 4
        Width = 127
        Height = 31
        Hint = ''
        Caption = 'Alterar Item'
        Anchors = [akLeft, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_Change_ItemsClick
      end
      object sb_Delete_Items: TUniSpeedButton
        Left = 258
        Top = 4
        Width = 129
        Height = 31
        Hint = ''
        Caption = 'Excluir Item'
        Anchors = [akLeft, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = sb_Delete_ItemsClick
      end
    end
    object UniPanel2: TUniPanel
      Left = 2
      Top = 2
      Width = 570
      Height = 55
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = 'UniPanel1'
      object L_Codigo: TUniLabel
        Left = 3
        Top = 6
        Width = 33
        Height = 14
        Hint = ''
        Caption = 'C'#243'digo'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 1
      end
      object E_ID: TUniEdit
        Left = 3
        Top = 21
        Width = 56
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
      object L_NameCompany: TUniLabel
        Left = 62
        Top = 6
        Width = 30
        Height = 14
        Hint = ''
        Caption = 'Marca'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 3
      end
      object E_Description: TUniEdit
        Left = 62
        Top = 21
        Width = 498
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 4
      end
    end
    object UniDBGrid1: TUniDBGrid
      Left = 2
      Top = 57
      Width = 570
      Height = 222
      Hint = ''
      DataSource = ds_search
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 3
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_vehicle_brand_id'
          Title.Caption = 'tb_vehicle_brand_id'
          Width = 101
          Visible = False
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 604
          Editor = E_model
        end>
    end
    object UniHiddenPanel1: TUniHiddenPanel
      Left = 24
      Top = 278
      Width = 513
      Height = 51
      Hint = ''
      Visible = True
      object E_model: TUniEdit
        Left = 3
        Top = 13
        Width = 498
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 696
    Top = 80
  end
  object cds_items: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    Left = 104
    Top = 170
    object cds_itemsid: TIntegerField
      FieldName = 'id'
    end
    object cds_itemstb_vehicle_brand_id: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tb_vehicle_brand_id'
      Calculated = True
    end
    object cds_itemsdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search: TDataSource
    DataSet = cds_items
    Left = 96
    Top = 226
  end
end
