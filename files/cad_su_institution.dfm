inherited CadSuInstitution: TCadSuInstitution
  ClientHeight = 494
  Caption = 'Super - Cadastro de Estabelecimentos'
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 430
    ExplicitTop = 430
    ExplicitWidth = 700
    inherited SB_Insert: TUniSpeedButton
      Left = 5
      Visible = True
      ExplicitLeft = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 96
      ExplicitLeft = 96
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 187
      Visible = True
      ExplicitLeft = 187
    end
    inherited SB_Save: TUniSpeedButton
      Left = 280
      ExplicitLeft = 280
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 373
      ExplicitLeft = 373
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 466
      ExplicitLeft = 466
    end
  end
  inherited pnl_fundo: TUniPanel
    ExplicitWidth = 700
    inherited pnl_fundo_linha_1: TUniPanel
      ExplicitWidth = 696
      inherited E_Ins_Mun: TUniEdit
        ExplicitWidth = 120
      end
    end
    inherited pnl_fundo_linha_2: TUniPanel
      ExplicitWidth = 696
      inherited E_NickTrade: TUniEdit
        ExplicitWidth = 376
      end
    end
    inherited pnl_fundo_linha_3: TUniPanel
      inherited Ctn_LineBusiness: TUniContainerPanel
        ExplicitWidth = 592
      end
    end
    inherited pnl_fundo_linha_4: TUniPanel
      ExplicitWidth = 696
      inherited E_WebSite: TUniEdit
        ExplicitWidth = 376
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    Height = 221
    ActivePage = Modulos
    ExplicitWidth = 700
    ExplicitHeight = 221
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 193
      inherited Ctn_Address: TUniContainerPanel
        Height = 193
        ExplicitWidth = 692
        ExplicitHeight = 193
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitHeight = 193
      inherited E_Obs: TUniMemo
        Height = 187
        ExplicitHeight = 187
      end
    end
    inherited tbs_tributacao: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 193
      inherited ChBx_OptanteSimples: TUniCheckBox
        ExplicitWidth = 686
      end
      inherited Chbx_IgnoraST: TUniCheckBox
        ExplicitWidth = 686
      end
      inherited Cb_Ind_IE_Dest: TUniComboBox
        ExplicitWidth = 686
      end
      inherited chbx_Just_Xml: TUniCheckBox
        ExplicitWidth = 686
      end
      inherited pnl_tributacai_linha_6: TUniPanel
        ExplicitWidth = 692
      end
      inherited pnl_tributacai_linha_7: TUniPanel
        ExplicitWidth = 692
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 193
    end
    object Modulos: TUniTabSheet
      Hint = ''
      Caption = 'Modulos'
      object dbg_AvalibleList: TUniDBGrid
        Left = 3
        Top = 1
        Width = 273
        Height = 190
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_available
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Disponiveis'
            Width = 604
          end>
      end
      object sb_int_to_mod: TUniSpeedButton
        Left = 282
        Top = 55
        Width = 56
        Height = 22
        Hint = ''
        Caption = '>>'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = sb_int_to_modClick
      end
      object sb_mod_to_int: TUniSpeedButton
        Left = 282
        Top = 88
        Width = 56
        Height = 22
        Hint = ''
        Caption = '<<'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_mod_to_intClick
      end
      object dbg_UsedList: TUniDBGrid
        Left = 344
        Top = 3
        Width = 273
        Height = 190
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_use
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 3
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Disponiveis'
            Width = 604
          end>
      end
    end
  end
  object cds_available: TClientDataSet
    PersistDataPacket.Data = {
      450000009619E0BD010000001800000002000000000003000000450002696404
      000100000000000B6465736372697074696F6E01004900000001000557494454
      480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 266
    object cds_availableid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_availabledescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search_available: TDataSource
    DataSet = cds_available
    Left = 224
    Top = 322
  end
  object cds_used: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 368
    Top = 266
    object cds_usedid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_useddescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search_use: TDataSource
    DataSet = cds_used
    Left = 368
    Top = 322
  end
end
