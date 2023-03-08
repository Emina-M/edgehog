#
# This file is part of Edgehog.
#
# Copyright 2023 SECO Mind Srl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
#

defmodule Edgehog.Repo.Migrations.CreateUpdateCampaigns do
  use Ecto.Migration

  def change do
    create table(:update_campaigns) do
      add :name, :string
      add :rollout_mechanism, :map
      add :tenant_id, references(:tenants, on_delete: :nothing)
      add :base_image_id, references(:base_images, on_delete: :nothing)
      add :update_channel_id, references(:update_channel, on_delete: :nothing)
      add :status, :string
      add :outcome, :string

      timestamps()
    end

    create unique_index(:update_campaigns, [:name])
    create index(:update_campaigns, [:tenant_id])
    create index(:update_campaigns, [:base_image_id])
    create index(:update_campaigns, [:update_channel_id])
  end
end
