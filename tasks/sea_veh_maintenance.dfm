inherited SeaVehMaintenance: TSeaVehMaintenance
  ClientHeight = 446
  ClientWidth = 943
  Caption = 'Manuten'#231#227'o de Ve'#237'culo'
  ExplicitWidth = 959
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 943
    Height = 382
    ExplicitWidth = 943
    ExplicitHeight = 382
    inherited pc_search: TUniPageControl
      Width = 939
      Height = 378
      ExplicitWidth = 939
      ExplicitHeight = 378
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 931
        ExplicitHeight = 350
        inherited pnl_param: TUniPanel
          Width = 931
          Height = 350
          ExplicitWidth = 931
          ExplicitHeight = 350
          object ChBx_Periodo: TUniCheckBox
            Left = 6
            Top = 6
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 6
            Top = 23
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 105
            Top = 23
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object UniLabel1: TUniLabel
            Left = 206
            Top = 9
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Ordem'
            TabOrder = 4
          end
          object E_order: TUniEdit
            Left = 206
            Top = 23
            Width = 64
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniLabel2: TUniLabel
            Left = 276
            Top = 9
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Placa'
            TabOrder = 6
          end
          object E_placa: TUniEdit
            Left = 273
            Top = 23
            Width = 68
            Hint = ''
            Text = ''
            TabOrder = 7
          end
          object UniLabel3: TUniLabel
            Left = 344
            Top = 9
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Prisma'
            TabOrder = 8
          end
          object E_prisma: TUniEdit
            Left = 344
            Top = 23
            Width = 68
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 415
            Top = 9
            Width = 281
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 10
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 931
        ExplicitHeight = 350
        inherited dbg_Search: TUniDBGrid
          Width = 931
          Height = 350
        end
      end
      object tbs_data_vehicle: TUniTabSheet
        Hint = ''
        Caption = 'Dados do Ve'#237'culo'
        DesignSize = (
          931
          350)
        object UniLabel4: TUniLabel
          Left = 8
          Top = 10
          Width = 61
          Height = 13
          Hint = ''
          Caption = 'Data Servi'#231'o'
          TabOrder = 0
        end
        object UniDateTimePicker1: TUniDateTimePicker
          Left = 8
          Top = 24
          Width = 97
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object UniLabel5: TUniLabel
          Left = 109
          Top = 10
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Prisma'
          TabOrder = 2
        end
        object E_prisma_: TUniEdit
          Left = 109
          Top = 24
          Width = 90
          Hint = ''
          Text = ''
          TabOrder = 3
        end
        object UniLabel6: TUniLabel
          Left = 202
          Top = 10
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Hora'
          TabOrder = 4
        end
        object E_hora: TUniEdit
          Left = 202
          Top = 24
          Width = 90
          Hint = ''
          Text = ''
          TabOrder = 5
        end
        object UniLabel20: TUniLabel
          Left = 294
          Top = 5
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'Ordem'
          TabOrder = 6
        end
        object E_order_: TUniEdit
          Left = 294
          Top = 24
          Width = 90
          Hint = ''
          Text = ''
          TabOrder = 7
        end
        object UniLabel14: TUniLabel
          Left = 387
          Top = 10
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Placa'
          TabOrder = 8
        end
        object E_placa_: TUniEdit
          Left = 387
          Top = 24
          Width = 90
          Hint = ''
          Text = ''
          TabOrder = 9
        end
        object UniLabel15: TUniLabel
          Left = 481
          Top = 10
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'Frota'
          TabOrder = 10
        end
        object E_frota: TUniEdit
          Left = 481
          Top = 24
          Width = 68
          Hint = ''
          Text = ''
          TabOrder = 11
        end
        object UniLabel16: TUniLabel
          Left = 553
          Top = 10
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Quilometragem'
          TabOrder = 12
        end
        object E_km: TUniEdit
          Left = 553
          Top = 24
          Width = 128
          Hint = ''
          Text = ''
          TabOrder = 13
        end
        object UniLabel17: TUniLabel
          Left = 684
          Top = 10
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'Ano'
          TabOrder = 14
        end
        object E_ano: TUniEdit
          Left = 684
          Top = 24
          Width = 68
          Hint = ''
          Text = ''
          TabOrder = 15
        end
        object UniLabel18: TUniLabel
          Left = 755
          Top = 10
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Cilindrada'
          TabOrder = 16
        end
        object E_cilindrada: TUniEdit
          Left = 755
          Top = 24
          Width = 68
          Hint = ''
          Text = ''
          TabOrder = 17
        end
        object UniLabel19: TUniLabel
          Left = 8
          Top = 49
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Marca'
          TabOrder = 18
        end
        object E_marca: TUniEdit
          Left = 8
          Top = 64
          Width = 295
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 19
        end
        object UniLabel21: TUniLabel
          Left = 306
          Top = 49
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Modelo'
          TabOrder = 20
        end
        object E_modelo: TUniEdit
          Left = 306
          Top = 64
          Width = 191
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 21
        end
        object E_tipo: TUniEdit
          Left = 501
          Top = 64
          Width = 191
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 22
        end
        object UniLabel23: TUniLabel
          Left = 695
          Top = 49
          Width = 17
          Height = 13
          Hint = ''
          Caption = 'Cor'
          TabOrder = 23
        end
        object E_cor: TUniEdit
          Left = 695
          Top = 64
          Width = 222
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 24
        end
        object M_memo: TUniMemo
          Left = 7
          Top = 108
          Width = 344
          Height = 118
          Hint = ''
          TabOrder = 25
        end
        object UniLabel24: TUniLabel
          Left = 8
          Top = 91
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'Observa'#231#227'o'
          TabOrder = 26
        end
        object UniDateTimePicker3: TUniDateTimePicker
          Left = 195
          Top = 238
          Width = 76
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 27
        end
        object UniDateTimePicker4: TUniDateTimePicker
          Left = 277
          Top = 238
          Width = 76
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 28
        end
        object UniGroupBox1: TUniGroupBox
          Left = 357
          Top = 91
          Width = 568
          Height = 190
          Hint = ''
          Caption = 'Contatos do Cliente'
          TabOrder = 29
          object UniLabel25: TUniLabel
            Left = 10
            Top = 16
            Width = 78
            Height = 13
            Hint = ''
            Caption = 'Nome do Cliente'
            TabOrder = 1
          end
          object E_customer: TUniEdit
            Left = 10
            Top = 32
            Width = 550
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object E_contact: TUniEdit
            Left = 10
            Top = 72
            Width = 550
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object UniLabel26: TUniLabel
            Left = 10
            Top = 56
            Width = 84
            Height = 13
            Hint = ''
            Caption = 'Nome do Contato'
            TabOrder = 4
          end
          object UniLabel27: TUniLabel
            Left = 10
            Top = 96
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'E_mail Principal'
            TabOrder = 5
          end
          object E_mail: TUniEdit
            Left = 10
            Top = 112
            Width = 550
            Hint = ''
            Text = ''
            TabOrder = 6
          end
          object UniLabel28: TUniLabel
            Left = 10
            Top = 136
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Fone'
            TabOrder = 7
          end
          object E_fone: TUniEdit
            Left = 10
            Top = 150
            Width = 103
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniLabel29: TUniLabel
            Left = 116
            Top = 136
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Fax/Outro'
            TabOrder = 9
          end
          object E_fax: TUniEdit
            Left = 116
            Top = 150
            Width = 103
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object UniLabel30: TUniLabel
            Left = 222
            Top = 136
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Celular'
            TabOrder = 11
          end
          object E_cel: TUniEdit
            Left = 222
            Top = 150
            Width = 103
            Hint = ''
            Text = ''
            TabOrder = 12
          end
          object UniLabel31: TUniLabel
            Left = 327
            Top = 136
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Comercial'
            TabOrder = 13
          end
          object E_comercial: TUniEdit
            Left = 327
            Top = 150
            Width = 103
            Hint = ''
            Text = ''
            TabOrder = 14
          end
          object UniLabel32: TUniLabel
            Left = 432
            Top = 136
            Width = 38
            Height = 13
            Hint = ''
            Caption = 'Portaria'
            TabOrder = 15
          end
          object UniEdit28: TUniEdit
            Left = 432
            Top = 150
            Width = 128
            Hint = ''
            Text = ''
            TabOrder = 16
          end
        end
        object UniSpeedButton9: TUniSpeedButton
          Left = 7
          Top = 232
          Width = 92
          Height = 31
          Hint = ''
          Caption = 'Editar'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 30
        end
        object UniSpeedButton10: TUniSpeedButton
          Left = 98
          Top = 232
          Width = 92
          Height = 31
          Hint = ''
          Caption = 'Check-list'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 31
        end
      end
      object tbs_parts: TUniTabSheet
        Hint = ''
        Caption = 'Pe'#231'as Trocadas'
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 931
          Height = 310
          Hint = ''
          DataSource = ds_peças
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
          OnTitleClick = dbg_SearchTitleClick
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 310
          Width = 931
          Height = 40
          Hint = ''
          Align = alBottom
          TabOrder = 1
          Caption = ''
          DesignSize = (
            931
            40)
          object UniSpeedButton1: TUniSpeedButton
            Left = 0
            Top = 5
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Inserir'
            Anchors = [akLeft, akBottom]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 1
          end
        end
      end
      object tbs_services: TUniTabSheet
        Hint = ''
        Caption = 'Servi'#231'os Executados'
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 0
          Width = 931
          Height = 310
          Hint = ''
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
        end
        object UniPanel2: TUniPanel
          Left = 0
          Top = 310
          Width = 931
          Height = 40
          Hint = ''
          Align = alBottom
          TabOrder = 1
          Caption = ''
          DesignSize = (
            931
            40)
          object UniSpeedButton2: TUniSpeedButton
            Left = 0
            Top = 5
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Inserir'
            Anchors = [akLeft, akBottom]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 1
          end
          object UniSpeedButton3: TUniSpeedButton
            Left = 127
            Top = 5
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'T'#233'cnico'
            Anchors = [akLeft, akBottom]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 2
          end
        end
      end
      object tbs_notes: TUniTabSheet
        Hint = ''
        Caption = 'Anota'#231#245'es'
        object UniDBGrid3: TUniDBGrid
          Left = 612
          Top = 0
          Width = 319
          Height = 350
          Hint = ''
          DataSource = ds_note
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
          OnTitleClick = dbg_SearchTitleClick
        end
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 612
          Height = 350
          Hint = ''
          Align = alLeft
          TabOrder = 1
          Caption = 'UniPanel1'
          object UniLabel33: TUniLabel
            Left = 0
            Top = 0
            Width = 52
            Height = 13
            Hint = ''
            Caption = 'Refer'#234'ncia'
            TabOrder = 1
          end
          object E_ref: TUniEdit
            Left = 0
            Top = 14
            Width = 606
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object M_note: TUniMemo
            Left = 0
            Top = 58
            Width = 606
            Height = 184
            Hint = ''
            Lines.Strings = (
              '')
            TabOrder = 3
          end
          object UniLabel34: TUniLabel
            Left = 0
            Top = 40
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Anota'#231#227'o'
            TabOrder = 4
          end
          object UniPanel4: TUniPanel
            Left = 1
            Top = 309
            Width = 610
            Height = 40
            Hint = ''
            Align = alBottom
            TabOrder = 5
            Caption = 'UniPanel1'
            DesignSize = (
              610
              40)
            object UniSpeedButton4: TUniSpeedButton
              Left = -1
              Top = 5
              Width = 92
              Height = 31
              Hint = ''
              Caption = 'Inserir'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              TabOrder = 1
            end
            object UniSpeedButton5: TUniSpeedButton
              Left = 90
              Top = 5
              Width = 92
              Height = 31
              Hint = ''
              Caption = 'Alterar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              TabOrder = 2
            end
            object UniSpeedButton6: TUniSpeedButton
              Left = 182
              Top = 5
              Width = 92
              Height = 31
              Hint = ''
              Caption = 'Excluir'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              TabOrder = 3
            end
            object UniSpeedButton7: TUniSpeedButton
              Left = 274
              Top = 5
              Width = 92
              Height = 31
              Hint = ''
              Caption = 'Gravar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              TabOrder = 4
            end
            object UniSpeedButton8: TUniSpeedButton
              Left = 366
              Top = 6
              Width = 92
              Height = 31
              Hint = ''
              Caption = 'Cancelar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 382
    Width = 943
    ExplicitTop = 382
    ExplicitWidth = 943
    inherited Sb_Close: TUniSpeedButton
      Left = 94
      ExplicitLeft = 94
    end
    inherited Sb_View: TUniSpeedButton
      Left = 281
      Visible = False
      ExplicitLeft = 281
    end
    inherited Sb_Search: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 189
      Visible = False
      ExplicitLeft = 189
    end
  end
  inherited ds_search: TDataSource
    Left = 680
    Top = 202
  end
  inherited cds_search: TClientDataSet
    Left = 680
    Top = 146
  end
  inherited DSP: TDataSetProvider
    Left = 680
    Top = 96
  end
  object cds_peças: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 808
    Top = 146
  end
  object ds_peças: TDataSource
    DataSet = cds_peças
    Left = 808
    Top = 202
  end
  object cds_service: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 744
    Top = 146
  end
  object ds_service: TDataSource
    DataSet = cds_service
    Left = 744
    Top = 202
  end
  object ds_note: TDataSource
    DataSet = cds_service
    Left = 864
    Top = 202
  end
  object cds_note: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 864
    Top = 146
  end
end
