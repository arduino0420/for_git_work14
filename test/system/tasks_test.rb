require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "タスク一覧ページ"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "新規作成"

    fill_in "内容", with: @task.content
    fill_in "タイトル", with: @task.title
    click_on "登録する"

    assert_text "タスクを登録しました"
    assert_selector "h1", text: "タスク一覧ページ"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "編集", match: :first

    fill_in "内容", with: @task.content
    fill_in "タイトル", with: @task.title
    click_on "更新する"

    assert_text "タスクを更新しました"
    assert_selector "h1", text: "タスク一覧ページ"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "タスクを削除しました"
  end
end
